#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt install -y build-essential
sudo apt install -y gcc python3.8-dev
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3.8 get-pip.py
sudo pip3.8 install virtualenvwrapper virtualenv
sudo apt-get -o Acquire::Retries=3 install -y *fftw3* intel-mkl*
sudo pip3.8 install --ignore-installed cryptography scipy dynesty
sudo pip3.8 install --ignore-installed git+https://github.com/gwastro/pycbc.git
sudo pip3.8 install pyopenssl
wget -qO - https://download.pegasus.isi.edu/pegasus/gpg.txt | sudo apt-key add -
echo "deb https://download.pegasus.isi.edu/pegasus/ubuntu bionic main" | sudo tee -a /etc/apt/sources.list
sudo apt-get -o Acquire::Retries=3 update
sudo apt-get -o Acquire::Retries=3 install -y pegasus
