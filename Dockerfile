from ubuntu:18.04

ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

RUN apt-get update -qq && \
    apt-get install -qqy --no-install-recommends \
    python3.8 \
    python3-pip \
    build-essential \
    libssl-dev \
    libffi-dev \
    vim \
    screen \
    git \
    wget \
    curl \
    cmake \
    htop \
    exuberant-ctags
# clean up. Need to change python3 to 3.8 or pip installs get confused
RUN rm -rf /var/lib/apt/lists/* && \
    rm -f /usr/bin/python3 && \
    rm -f /usr/bin/python3.6* && \
    rm -f /usr/bin/python && \
    ln -s /usr/bin/python3.8 /usr/bin/python3 && \
    ln -s /usr/bin/python3.8 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    rm -rf ~/.cache
# install pip libraries needed for most installs
RUN pip install wheel==0.33.6 && \
    pip install setuptools==42.0.2 && \
    pip install -U pip==19.3.1
# For some reason this needs to be separated for the other pip installs
RUN pip install flake8==3.8.3 && \
    pip install black==20.8b1
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
COPY bashrc /root/.bashrc
COPY bash_profile /root/.bash_profile
COPY git-completion.sh /root/.git-completion.sh
COPY bash_aliases /root/.bash_aliases
COPY ctags /root/.ctags
COPY vimrc /root/.vimrc
RUN vim +PluginInstall +qall
 WORKDIR /root/develop
