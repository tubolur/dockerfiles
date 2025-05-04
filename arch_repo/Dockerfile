FROM docker.io/archlinux

ENV VERSION="0.1.2"
ENV SOURCE_DIR=/usr/share/dev
ENV MAIN_USERNAME=debian
ENV SERVER_USERNAME=public
ENV HTTPS_SERVER_WORKING_DIR=~/public
ENV HTTPS_SERVER_SOURCE=https://github.com/tubolur/servertools
ENV ALIAS_SOURCE=https://github.com/tubolur/vps_config

RUN /bin/sh -c locale-gen

CMD ["/usr/bin/bash"]

RUN pacman -Syu --noconfirm \
            wget \
    && find /var/cache/pacman/ -type f -delete

RUN pacman -Sy --noconfirm \
            freetype2 \
            gcc \
            git \
            make \
            python \
            python-virtualenv \
            sudo \
            nano \
            sqlite \
    && find /var/cache/pacman/ -type f -delete
    
RUN /sbin/useradd -m $SERVER_USERNAME
#RUN echo "$SERVER_USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#USERLAND
USER public

# ALIASES
RUN mkdir -p "/home/$SERVER_USERNAME/dev"  && cd "/home/$SERVER_USERNAME/dev" && git clone "$ALIAS_SOURCE" && cat vps_config/.bash_aliases "/home/$SERVER_USERNAME/.bashrc" > vps_config/.bashrc && mv vps_config/.bashrc "/home/$SERVER_USERNAME/.bashrc" && source "/home/$SERVER_USERNAME/.bashrc"

# HTTPS SERVER
RUN cd "/home/$SERVER_USERNAME/dev" && git clone "$HTTPS_SERVER_SOURCE" && cd servertools && chmod +x utils/install.sh && cd "/home/$SERVER_USERNAME/dev" && cd servertools && ./utils/install.sh && mkdir -p "/home/$SERVER_USERNAME/public" && echo "this is a test server v${VERSION}" > "/home/$SERVER_USERNAME/public/hello.txt" && echo "alias httpserver='cd /home/$SERVER_USERNAME/public && source /home/$SERVER_USERNAME/dev/servertools/venv/bin/activate && python3 /home/$SERVER_USERNAME/dev/servertools/runHTTPS.py'" >> "/home/$SERVER_USERNAME/.bashrc" && source /home/$SERVER_USERNAME/.bashrc

# retrieve key & cert
COPY cert.pem /home/public/dev/servertools/utils/cert.pem
COPY key.pem /home/public/dev/servertools/utils/key.pem

#retrieve repo files
RUN mkdir -p "/home/$SERVER_USERNAME/public/repo"
COPY custom.db /home/public/public/repo
COPY custom.db.tar.gz /home/public/public/repo
COPY custom.files /home/public/public/repo
COPY custom.files.tar.gz /home/public/public/repo
COPY fors-sala-bin-1.0.0-1-x86_64.pkg.tar.zst /home/public/public/repo

USER root
RUN chown -R "$SERVER_USERNAME" "/home/$SERVER_USERNAME/public/repo"
RUN chown -R "$SERVER_USERNAME" "/home/public/dev/servertools/utils"

USER public
