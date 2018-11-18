from annot_runner import AnnotRunner
from annotmined_runner import  MinedRunner
import os
import shutil
import zipfile
from taisazero.email_tool import EmailTool

#Add your options here and update the loop in ultraLauncher.bash
ant_options = [
    AnnotRunner(model_type='unigram',epochs= 15, layer_dim= 100, alpha= 0.01)
]

ant = ant_options[0]

ant_select = int(sys.argv[1])
if ant_select < len(ant_options):
    print("Setting ant")
    ant = ant_options[ant_select]
else:
    print("Failed to set ant...., using default")

ant.run()
