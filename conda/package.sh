#!/bin/bash
set -x

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda.sh
bash $HOME/miniconda.sh -b -p $MINICONDA_DIR
source $MINICONDA_DIR/bin/activate $MINICONDA_DIR
conda --version
conda config --set always_yes yes
conda config --set anaconda_upload yes
conda install anaconda conda-build
conda build ./conda --py $TRAVIS_PYTHON_VERSION --user $UPLOAD_USER --token $ANACONDA_API_TOKEN
