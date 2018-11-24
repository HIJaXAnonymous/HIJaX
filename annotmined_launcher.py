from annot_runner import AnnotRunner
from annotmined_runner import  MinedRunner
import os
import shutil
import zipfile
import sys
from taisazero.email_tool import EmailTool

#Add your options here and update the loop in ultraLauncher.bash
ant_mined_options = [
    MinedRunner(model_type='unigram',epochs= 10,layers = 1,layer_dim =128, mined_data = 'conala-unique_mined'),
    MinedRunner(model_type='unigram',epochs= 10,layers = 1,layer_dim =128, embedding = 'embeddings/conala-annotmined-input-stemmed.vec',
                trg_embedding = 'embeddings/conala-annotmined-output-stemmed.vec',mined_data = 'conala-unique_mined')
]

ant_mined = ant_mined_options[0]

ant_mined_select = int(sys.argv[1])
if ant_mined_select < len(ant_mined_options):
    print("Setting ant_mined")
    ant_mined = ant_mined_options[ant_mined_select]
else:
    print("Failed to set ant_mined...., using default")

ant_mined.run()
