# coding=utf-8

from __future__ import print_function
import re
import ast
import astor
import string
#from nltk.stem import PorterStemmer

#You may need to import your stemmer here too


QUOTED_STRING_RE = re.compile(r"(?P<quote>[`'\"])(?P<string>.*?)(?P=quote)")

def replace_strings_in_ast(py_ast, string2slot):
    for node in ast.walk(py_ast):
        for k, v in list(vars(node).items()):
            if k in ('lineno', 'col_offset', 'ctx'):
                continue
            # Python 3
            # if isinstance(v, str) or isinstance(v, unicode):
            if isinstance(v, str):
                if v in string2slot:
                    val = string2slot[v]
                    # Python 3
                    # if isinstance(val, unicode):
                    #     try: val = val.encode('ascii')
                    #     except: pass
                    setattr(node, k, val)
                else:
                    # Python 3
                    # if isinstance(v, str):
                    #     str_key = unicode(v)
                    # else:
                    #     str_key = v.encode('utf-8')
                    str_key = v

                    if str_key in string2slot:
                        val = string2slot[str_key]
                        if isinstance(val, str):
                            try: val = val.encode('ascii')
                            except: pass
                        setattr(node, k, val)

class Canonical:
    #remove -regex matches you want to remove
    #replace regex matches you want to replace with another word (regex:word)
    #stemmer the stmmer object you want to use, calls .stem() on tokens
    #remove_punctuation removes punctuation when set to True
    #lower converts intent to lower case when set to True
    #std_var Standardize Variables, replaces variables with standardized names when set to True
    def __init__(self, remove = [], replace = {}, stemmer = None, remove_punctuation = False, lower = False, std_var = False):
        self.slot_map = dict()
        
        #Compile all the removes!
        #self.remove = re.compile('|'.join(re.compile(x).pattern for x in remove))
        self.remove = remove

        #Compile the replaces too
        self.replace = {}
        for match, repl in replace.items(): self.replace[re.compile(match)] = repl

        self.std_var = std_var
        self.stemmer = stemmer
        self.remove_punctuation = remove_punctuation
        self.lower = lower
        self.translator = str.maketrans('', '', string.punctuation)

    def canonicalize_intent(self, intent):
        str_matches = QUOTED_STRING_RE.findall(intent)

        self.slot_map = dict()
        if (not self.std_var):
            return intent

        for i in range(len(str_matches)):
            if not str_matches[i][1] in self.slot_map:
                self.slot_map[str_matches[i][1]] = "var"
            intent = intent.replace(str_matches[i][0] + str_matches[i][1] + str_matches[i][0], self.slot_map[str_matches[i][1]])

        return intent

    def canonicalize_code(self, code):
        #string2slot = {x[1]['value']: x[0] for x in list(self.slot_map.items())}
        
        py_ast = ast.parse(code)
        replace_strings_in_ast(py_ast, self.slot_map)
        canonical_code = astor.to_source(py_ast)

        return canonical_code

    def decanonicalize_code(self, code):
        try:
          #slot2string = {x[0]: x[1]['value'] for x in list(self.slot_map.items())}
          py_ast = ast.parse(code)
          replace_strings_in_ast(py_ast, self.slot_map)
          raw_code = astor.to_source(py_ast)
          # for slot_name, slot_info in slot_map.items():
          #     raw_code = raw_code.replace(slot_name, slot_info['value'])

          return raw_code.strip()
        except:
          return code

    #Strips the intent based off of the object's parameters
    def clean_intent(self, intent):

        if (self.lower): intent = intent.lower()

        if (self.remove_punctuation): intent = intent.translate(self.translator) 

        for rgx_match in self.remove:
            intent = re.sub(rgx_match, '', intent)

        for match, repl in self.replace.items():
            intent = match.sub(repl, intent)

        intent = re.sub(' +',' ', intent) #Clean up any extra spaces....

        #If we are using a tokenizer, use it!
        if (self.stemmer is not None):
            tokens = intent.split(" ")
            for i in range(0, len(tokens)):
                tokens[i] = self.stemmer.stem(tokens[i])
            intent = " ".join(tokens)

        return intent
