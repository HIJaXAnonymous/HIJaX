import json
import re
test_set=open('C:\\Users\\E-Neo.DESKTOP-M4A5E83\\Documents\\NLP-Project\\conala-corpus\\conala-test.json','r', encoding = 'utf-8').read()

train_set=open('C:\\Users\\E-Neo.DESKTOP-M4A5E83\\Documents\\NLP-Project\\conala-corpus\\conala-train.json','r', encoding = 'utf-8').read()

test_set=json.loads(test_set)

train_set = json.loads(train_set)

train_text=''
for train_entry in train_set:
    if train_entry['rewritten_intent'] != None and '\t' not in train_entry['snippet'] and '\n' not in train_entry['snippet']:
        train_entry['rewritten_intent'] = re.sub(r'[\n]', '', train_entry['rewritten_intent'])
        train_text += train_entry['rewritten_intent'] +'\t'+train_entry['snippet']+'\n'



test_text = ''
for test_entry in test_set:
    if test_entry['rewritten_intent'] != None and '\t' not in test_entry['snippet'] and '\n' not in test_entry['snippet']:
        test_entry['rewritten_intent']=re.sub(r'[\n]','',test_entry['rewritten_intent'])
        test_text += test_entry['rewritten_intent'] +'\t'+test_entry['snippet']+'\n'


f = open('train.txt','w',encoding = 'utf-8')
f2=open('test.txt','w',encoding = 'utf-8')
f.write(train_text)
f2.write(test_text)