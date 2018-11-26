from annot_runner import AnnotRunner
from annotmined_runner import  MinedRunner
import os
import shutil
import zipfile
import sys
from taisazero.email_tool import EmailTool

#Add your options here and update the loop in ultraLauncher.bash
ant_options = [
    AnnotRunner(model_type='unigram',epochs= 2, layer_dim= 128, alpha= 0.01),
    AnnotRunner(model_type='unigram',epochs= 30, layer_dim= 128, alpha= 0.01),
    AnnotRunner(model_type='unigram',epochs= 30, layer_dim= 128, alpha= 0.01,min_freq=12)

    
]

ant = ant_options[0]

ant_select = int(sys.argv[1])
if ant_select < len(ant_options):
    print("Setting ant")
    ant = ant_options[ant_select]
else:
    print("Failed to set ant...., using default")

ant.run()
