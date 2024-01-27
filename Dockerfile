FROM --platform=linux/amd64 ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt update \
    && apt install -y build-essential curl wget \
    && apt install -y gcc python3.8-dev python3-pip git openssh-client findutils \
    && pip install virtualenvwrapper virtualenv \
    && apt-get -o Acquire::Retries=3 install -y *fftw3* intel-mkl* \
    && pip3 install --ignore-installed cryptography scipy dynesty \
    && pip3 install --ignore-installed git+https://github.com/gwastro/pycbc.git \
    && pip3 install pyopenssl
    # && wget -qO - https://download.pegasus.isi.edu/pegasus/gpg.txt | apt-key add - \
    # && echo 'deb https://download.pegasus.isi.edu/pegasus/ubuntu focal main' >/etc/apt/sources.list.d/pegasus.list \
    # && apt-get -o Acquire::Retries=3 update \
    # && apt-get -o Acquire::Retries=3 install -y pegasus
