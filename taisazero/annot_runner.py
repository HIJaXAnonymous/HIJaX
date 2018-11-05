import os
import random

import numpy as np


from xnmt.modelparts.attenders import MlpAttender
from xnmt.batchers import WordSrcBatcher,InOrderBatcher,Batcher
from xnmt.modelparts.bridges import CopyBridge
from xnmt.modelparts.decoders import AutoRegressiveDecoder
from xnmt.modelparts.embedders import SimpleWordEmbedder
from xnmt.eval.tasks import LossEvalTask, AccuracyEvalTask
from xnmt.experiments import Experiment,ExpGlobal
from xnmt.inferences import AutoRegressiveInference
from xnmt.input_readers import PlainTextReader
from xnmt.transducers.recurrent import BiLSTMSeqTransducer, UniLSTMSeqTransducer
from xnmt.modelparts.transforms import AuxNonLinear
from xnmt.modelparts.scorers import Softmax
from xnmt.optimizers import AdamTrainer
from xnmt.param_collections import ParamManager
from xnmt.persistence import save_to_file
import xnmt.tee
from xnmt.train.regimens import SimpleTrainingRegimen
from xnmt.models.translators import DefaultTranslator
from xnmt.vocabs import Vocab
from xnmt.preproc import PreprocVocab,PreprocTokenize,PreprocRunner,SentencepieceTokenizer,VocabFiltererFreq
from xnmt.search_strategies import BeamSearch
from xnmt.length_norm import PolynomialNormalization

seed=13
random.seed(seed)
np.random.seed(seed)

EXP_DIR = os.path.dirname(__file__)
EXP = "annotmined"

model_file = f"{EXP_DIR}/results/{EXP}.mod"
log_file = f"{EXP_DIR}/results/{EXP}.log"

xnmt.tee.set_out_file(log_file,exp_name=EXP)

ParamManager.init_param_col()
ParamManager.param_col.model_file = model_file

pre_runner=PreprocRunner(tasks= [PreprocTokenize(in_files=[f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.intent',
                                                           f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.snippet',
                                                           f'{EXP_DIR}/conala-corpus/conala-dev.intent',
                                                           f'{EXP_DIR}/conala-corpus/conala-dev.snippet',
                                                           f'{EXP_DIR}/conala-corpus/conala-test.intent',
                                                           f'{EXP_DIR}/conala-corpus/conala-test.snippet'],
                                                 out_files= [f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.intent',
                                                             f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.snippet',
                                                             f'{EXP_DIR}/conala-corpus/conala-dev.tmspm16000.intent',
                                                             f'{EXP_DIR}/conala-corpus/conala-dev.tmspm16000.snippet',
                                                             f'{EXP_DIR}/conala-corpus/conala-test.tmspm16000.intent',
                                                             f'{EXP_DIR}/conala-corpus/conala-test.tmspm16000.snippet'],
                                                 specs= [{'filenum':'all',
                                                         'tokenizers':[SentencepieceTokenizer(
                                                             train_files= [f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.intent',
                                                                           f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.snippet'],vocab_size=16000,
                                                         model_type= 'unigram',model_prefix= 'conala-corpus/conala-trainnodev+mined.tmspm16000.spm')]}])
    ,PreprocVocab(in_files= [f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.intent',
                             f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.snippet'],
                  out_files=[f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.intent.vocab',
                             f'{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.snippet.vocab'],
                  specs=[{'filenum':'all','filters':VocabFiltererFreq(min_freq = 2)}])],overwrite=False)

src_vocab = Vocab(vocab_file=f"{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.intent.vocab")
trg_vocab = Vocab(vocab_file=f"{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.snippet.vocab")

batcher = Batcher(batch_size=64)

inference = AutoRegressiveInference(search_strategy= BeamSearch(len_norm= PolynomialNormalization(apply_during_search=True),beam_size= 5),post_process= 'join-piece')

layer_dim = 128

model = DefaultTranslator(
  src_reader=PlainTextReader(vocab=src_vocab),
  trg_reader=PlainTextReader(vocab=trg_vocab),
  src_embedder=SimpleWordEmbedder(emb_dim=128),

  encoder=BiLSTMSeqTransducer(input_dim=layer_dim, hidden_dim=layer_dim, layers=1),
  attender=MlpAttender(hidden_dim=layer_dim, state_dim=layer_dim, input_dim=layer_dim),
  trg_embedder=SimpleWordEmbedder(emb_dim=layer_dim, vocab_size=len(trg_vocab)),

#  decoder=AutoRegressiveDecoder(input_dim=layer_dim,
#                                rnn=BiLSTMSeqTransducer(input_dim=layer_dim, hidden_dim=layer_dim,
 #                                                        decoder_input_dim=layer_dim, yaml_path="decoder"),
  #                              transform=AuxNonLinear(input_dim=layer_dim, output_dim=layer_dim,
   #                                                    aux_input_dim=layer_dim),
    #                            scorer=Softmax(vocab_size=len(trg_vocab), input_dim=layer_dim),
     #                           trg_embed_dim=layer_dim,
      #                          bridge=CopyBridge()),
  #inference=inference)

decoder = AutoRegressiveDecoder(bridge=CopyBridge(),inference=inference))

train = SimpleTrainingRegimen(
  name=f"{EXP}",
  model=model,
  batcher=WordSrcBatcher(avg_batch_size=64),
  trainer=AdamTrainer(alpha=0.001),
  patience= 3,
  lr_decay= 0.5,
  restart_trainer= True,
  run_for_epochs=30,
  src_file= f"{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.intent",
  trg_file= f"{EXP_DIR}/conala-corpus/conala-trainnodev+mined.tmspm16000.snippet",
  dev_tasks=[LossEvalTask(src_file=f"{EXP_DIR}/conala-corpus/conala-dev.tmspm16000.intent",
                          ref_file= f'{EXP_DIR}/conala-corpus/conala-dev.tmspm16000.snippet',
                          model=model,
                          batcher=WordSrcBatcher(avg_batch_size=64)),
             AccuracyEvalTask(eval_metrics= 'bleu',
                              src_file= f'{EXP_DIR}/conala-corpus/conala-dev.tmspm16000.intent',
                              ref_file= f'{EXP_DIR}/conala-corpus/conala-dev.snippet',
                              hyp_file= f'results/{EXP}.dev.hyp')])

evaluate = [AccuracyEvalTask(eval_metrics="bleu",
                             src_file=f"{EXP_DIR}/conala-corpus/conala-test.tmspm16000.intent",
                             ref_file=f"{EXP_DIR}/conala-corpus/conala-test.snippet",
                             hyp_file=f"results/{EXP}.test.hyp",
                             inference=inference,
                             model=model)]

standard_experiment = Experiment(
  exp_global= ExpGlobal(default_layer_dim= 512, dropout= 0.3,
                        log_file= log_file,model_file=model_file),
  name="annotmined",
  model=model,
  train=train,
  evaluate=evaluate
)

# run experiment
standard_experiment(save_fct=lambda: save_to_file(model_file, standard_experiment))

exit()