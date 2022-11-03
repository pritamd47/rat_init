#!/usr/bin/bash

# read arguments, use -d flag to pass the directory path of RAT
while getopts d: flag
do
    case "${flag}" in
        d) RATDIR=${OPTARG};;
    esac
done

# first, install miniconda
echo "Installing Miniconda"
mkdir -p /tmp/Downloads
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P /tmp/Downloads
bash /tmp/Downloads/Miniconda3-latest-Linux-x86_64.sh -b -f -p $HOME/conda
rm /tmp/Downloads/Miniconda3-latest-Linux-x86_64.sh

echo 'eval "$($HOME/conda/bin/conda shell.bash hook)"' > $HOME/activate_conda.sh


# change directory to RATDIR, and create the directories
echo "Creating directories at $RATDIR"
mkdir -p $RATDIR/backend/data/ancillary
mkdir -p $RATDIR/backend/data/raw/precipitation
mkdir -p $RATDIR/backend/data/raw/tmax
mkdir -p $RATDIR/backend/data/raw/tmin
mkdir -p $RATDIR/backend/data/raw/uwnd
mkdir -p $RATDIR/backend/data/raw/vwnd
mkdir -p $RATDIR/backend/data/raw/uwnd_daily
mkdir -p $RATDIR/backend/data/raw/vwnd_daily
mkdir -p $RATDIR/backend/data/processed/precipitation
mkdir -p $RATDIR/backend/data/processed/tmax
mkdir -p $RATDIR/backend/data/processed/tmin
mkdir -p $RATDIR/backend/data/processed/uwnd
mkdir -p $RATDIR/backend/data/processed/vwnd
mkdir -p $RATDIR/backend/data/nc
mkdir -p $RATDIR/backend/models


# initialize conda and install models
source $HOME/activate_conda.sh

# install metsim
conda create -n metsim -c conda-forge metsim -y

# install vic
conda create -p $RATDIR/backend/models/vic_env -c conda-forge vic -y