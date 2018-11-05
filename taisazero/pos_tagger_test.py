import json

import spacy



nlp = spacy.load('en_core_web_sm')


file = open('D:\\NLP-Project\\conala-corpus\\conala-test.json','r')

j_o=json.loads(file.read())

for i in j_o:
    if i ['rewritten_intent']!= None:
        doc = nlp( i['rewritten_intent'])
        for token in doc:
            print(token.text, token.lemma_, token.pos_, token.tag_, token.dep_)

