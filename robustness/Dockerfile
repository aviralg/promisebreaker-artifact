    ################################################################################
## https://hub.docker.com/_/debian/
################################################################################
FROM debian:buster

################################################################################
## Upgrade
################################################################################
RUN apt-get update
RUN apt-get -y dist-upgrade

################################################################################
## Miscellaneous
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install sudo apt-utils debian-keyring

################################################################################
## Locale
## https://hub.docker.com/_/debian/
## https://github.com/docker-library/postgres/blob/69bc540ecfffecce72d49fa7e4a46680350037f9/9.6/Dockerfile#L21-L24
## http://jaredmarkell.com/docker-and-locales/
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen en_US.UTF-8
RUN /usr/sbin/update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


################################################################################
## Upgrade
################################################################################
RUN apt-get update

################################################################################
## Shell
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install fish bash zsh

################################################################################
## Editor
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install vim emacs --fix-missing

################################################################################
## Version Control
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install git subversion

################################################################################
## Data Transfer
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install curl wget rsync

################################################################################
## Process Monitoring
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install procps htop

################################################################################
## Latex
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install texinfo texlive texlive-fonts-extra libcairo2-dev libtiff-dev

################################################################################
## R Base
## https://cran.r-project.org/bin/linux/debian/
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install r-base r-base-dev

################################################################################
## R Package Dependencies
################################################################################
#git2r
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install libgit2-dev
#httr
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install libssl-dev
#xml2
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install libxml2-dev
#curl
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install libcurl4-openssl-dev
#rJava
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install openjdk-11-jdk default-jdk
#RMySQL
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install default-libmysqlclient-dev
#RSQLite
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install libsqlite3-dev
#odbc
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install unixodbc-dev
#rgl
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install freeglut3-dev libfreetype6-dev
# promise-dyntracing-experiment
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install xvfb expect libzstd-dev time tree pandoc xfonts-100dpi xfonts-75dpi
# latest version of GNU parallel
RUN curl -L https://bit.ly/install-gnu-parallel | sh -x

RUN DEBIAN_FRONTEND=noninteractive sudo apt-get -qy install libpcre2-dev
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get -qy install flex bison

################################################################################
## Web Server
## https://www.linkedin.com/pulse/serve-static-files-from-docker-via-nginx-basic-example-arun-kumar
################################################################################
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install nginx
RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/
ADD small /var/www/small
ADD large /var/www/large

################################################################################
## User
################################################################################
RUN useradd -ms /bin/bash -G sudo aviral
RUN echo "aviral:aviral" | chpasswd
RUN echo "aviral ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER aviral
WORKDIR /home/aviral
RUN chown aviral /home/aviral
ENV R_LIBS_USER /home/aviral/promisebreaker-experiment/dependency/library/install
ENV R_KEEP_PKG_SOURCE 1
ENV R_ENABLE_JIT 0
ENV R_COMPILE_PKGS 0
ENV R_DISABLE_BYTECODE 1
ENV OMP_NUM_THREADS 1
ADD .Rprofile /home/aviral/
ADD promisebreaker-experiment /home/aviral/promisebreaker-experiment
RUN sudo chown -R aviral /home/aviral/promisebreaker-experiment
RUN mkdir -p /home/aviral/promisebreaker-experiment/dependency

################################################################################
## R-dyntrace
################################################################################
RUN cd /home/aviral/promisebreaker-experiment/dependency && git clone --branch oopsla-2021-artifact https://github.com/PRL-PRG/R-dyntrace.git
RUN cd /home/aviral/promisebreaker-experiment/dependency/R-dyntrace && ./build

################################################################################
## R-vanilla
################################################################################
RUN cd /home/aviral/promisebreaker-experiment/dependency && git clone --branch r-4.0.2 https://github.com/PRL-PRG/R-vanilla.git
RUN cd /home/aviral/promisebreaker-experiment/dependency/R-vanilla && ./build

#############################################################################
## library
#############################################################################
RUN mkdir -p $R_LIBS_USER
RUN cd /home/aviral/promisebreaker-experiment && make install-packages

################################################################################
## instrumentr
################################################################################
RUN cd /home/aviral/promisebreaker-experiment/dependency && git clone --branch oopsla-2021-artifact https://github.com/PRL-PRG/instrumentr.git
RUN cd /home/aviral/promisebreaker-experiment/dependency/instrumentr && make R=../R-dyntrace/bin/R

##############################################################################
# lazr
##############################################################################
RUN cd /home/aviral/promisebreaker-experiment/dependency && git clone --branch oopsla-2021-artifact https://github.com/aviralg/lazr.git
RUN cd /home/aviral/promisebreaker-experiment/dependency/lazr && make R=../R-dyntrace/bin/R

###############################################################################
# strictr
###############################################################################
RUN cd /home/aviral/promisebreaker-experiment/dependency && git clone --branch oopsla-2021-artifact https://github.com/aviralg/strictr.git
RUN cd /home/aviral/promisebreaker-experiment/dependency/strictr && make R=../R-dyntrace/bin/R

###############################################################################
# experimentr
###############################################################################
RUN  cd /home/aviral/promisebreaker-experiment/dependency && git clone --branch oopsla-2021-artifact https://github.com/aviralg/experimentr.git
RUN  cd /home/aviral/promisebreaker-experiment/dependency/experimentr && make R=../R-dyntrace/bin/R

##############################################################################
# promisebreaker-paper
##############################################################################
RUN cd /home/aviral/promisebreaker-experiment/ && git clone --branch oopsla-2021-artifact https://github.com/aviralg/promisebreaker-paper.git paper

RUN make -C /home/aviral/promisebreaker-experiment/ experiment-corpus-extract

ADD entrypoint.sh /home/aviral/
ENTRYPOINT ["/home/aviral/entrypoint.sh"]
