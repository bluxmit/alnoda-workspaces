FROM alnoda/base-devspace:4.0

RUN echo "------------------------------------------------------ emacs" \
    && sudo add-apt-repository -y ppa:kelleyk/emacs \
    && sudo apt-get -y update \
    && sudo apt-get install -y emacs28 \

    && echo "------------------------------------------------------ spacemacs" \
    && git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d