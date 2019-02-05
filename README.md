# Team UNCC - CoNaLa Challenge

![CoNaLa Logo](https://conala-corpus.github.io/conala-logo.png "CoNaLa Logo")

This repository contains our submission for the [CoNaLa Challenge competition](https://competitions.codalab.org/competitions/19175). Our team members are: 
* 💖 Erfan Al-Hossami
* 💖 Mariah Olson
* 💖 Brandon Beckwidth

## Table of contents

  * [Architecture Diagram](#architecture-diagram)
  * [Setup Prerequisites](#setup-prerequisites)
      * [Setup A Cluster Account](#cluster-account)
      * [Setup Python 3.7](#python)
  * [UNCC Model Setup On Linux](#uncc-model-setup-on-linux)
  * [More Infomation](#more-information)
  
## Architecture Diagram

To be added.


## Setup Prerequisites

Before setting up our project we'd like to make sure you have some prerequisite installations and setups.

### Cluster Account


This step is optional. UNC Charlotte provides a cluster for educational purposes, [*Mamba*](https://urc.uncc.edu/educational-clusters/mamba-user-notes), and a research cluster, [*Copperhead*](https://urc.uncc.edu/faqs/copperhead-user-notes). Request an account in the appropriate cluster using the links mentioned earlier.

To use the cluster in UNC Charlotte you need to have *Duo* set up on your mobile device & UNC Charlotte account. Follow this [guide](https://spaces.uncc.edu/pages/viewpage.action?pageId=35651686) to setup Duo.

**Note:** Since training the model takes a long time we highly recommend using a computer cluster.


### Python

If you are using the cluster run the following command to enable **Python 3.7 with CUDA**: `module load cuda/8.0 cudnn/6.0-cuda8 anaconda3/5.0.1-cuda8` - Thanks to the UNCC Cluster Support Team for the help :').

If you are not using the cluster, install **Python 3.7** from [*Anaconda*](https://www.anaconda.com/download/).


## UNCC Model Setup on Linux
This section is written based on our setup experience on UNCC's *Copperhead* cluster which runs *Red Hat's Linux 7.5*.

### Step 1: Python Setup
 To access Python 3 with cuda run the following command ``module load cuda/8.0 cudnn/6.0-cuda8 anaconda3/5.0.1-cuda8``
 **Note:** You need to run the above command on the cluster every time you login because the default python version is 2.7.
 **Optional:** To make *Python 3.7 w/ CUDA* the default Python run the following command ``echo 'module load cuda/8.0 cudnn/6.0-cuda8 anaconda3/5.0.1-cuda8' >> ~/.bashrc``
 ### Step 2: Dependencies Setup
 * Install *Dynet* using the command ``pip install --user dynet``
 * Install [xnmt](https://github.com/neulab/xnmt) using the following commands:
   * ``wget https://github.com/neulab/xnmt/archive/0.1.0.tar.gz``
   * ``pip install --user 0.1.0.tar.gz``
   
   
 
 ### Step 3: UNCC's Model Setup
Run the following command in terminal/command prompt ``git clone https://github.com/taisazero/UNCC-CoNaLa.git``

### Step 4: Test Run



## More Information
For more information on what each file and folder contains, please visit this [wikipage](to_add.com).

## Thanks & Recognitions    <img src="https://thumbs.gfycat.com/TepidRequiredHeifer-size_restricted.gif" width="65">

 
* Our team would like to thank our advisor [Dr. Samira Shaikh](https://webpages.uncc.edu/sshaikh2/index.html), for her continous support for this project.

* We'd also like to recognize the authors of [xnmt](https://github.com/neulab/xnmt) & the organizers of the [CoNaLa challenge](https://conala-corpus.github.io/) for making our project possible.
