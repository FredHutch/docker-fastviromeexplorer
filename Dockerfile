FROM ubuntu:16.04

RUN apt update && \
    apt-get install -y build-essential wget unzip python2.7 \
    python-dev git python-pip bats awscli curl ncbi-blast+ \
    lbzip2 pigz autoconf autogen libssl-dev cmake \
    default-jre default-jdk

RUN cd /usr/local && \
    wget https://github.com/pachterlab/kallisto/releases/download/v0.45.0/kallisto_linux-v0.45.0.tar.gz && \
    tar xzvf kallisto_linux-v0.45.0.tar.gz && \
    ln -s $PWD/kallisto_linux-v0.45.0/kallisto /usr/local/bin/

RUN cd /usr/local && \
    wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
    tar vxjf samtools-1.9.tar.bz2 && \
    cd samtools-1.9 && \
    ./configure --without-curses --disable-bz2 --disable-lzma && \
    make && \
    make install

RUN cd /usr/local && \
    git clone https://code.vt.edu/saima5/FastViromeExplorer.git && \
    cd FastViromeExplorer && \
    git checkout aeb2a86861890ba1c33db6df899a9bcbb6a4a7c4 && \
    javac -d bin src/*.java
