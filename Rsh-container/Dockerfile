FROM registry.gitlab.com/rirvm/rir_mirror/benchmark:ac583eacf191f91d1a82c54b0f38f15d148cacf9
ADD run.sh /opt/run.sh
ADD promisebreaker-graphs /opt/paper

CMD /opt/run.sh

RUN R -e "install.packages(\"rmarkdown\")" && \
    R -e "apt-get -y install pandoc" && \
    R -e "install.packages(\"scales\")" && \
    apt-get -y install libssl-dev && \
    apt-get -y install xml2 && \
    apt-get -y install libxml2-dev && \
    R -e "install.packages(\"tidyverse\")" && \
    R -e "install.packages(\"fst\")" && \ 
    R -e "install.packages(\"fs\")" && \
    R -e "install.packages(\"DT\")" && \
    R -e "install.packages(\"tikzDevice\")" && \
    R -e "install.packages(\"viridis\")" && \
    rm -rf /opt/rir && \
    cd /opt/rbenchmarking && \
    git fetch origin 5f34747fbfb53c0eabaa585a255b22bfd5cc567f && \ 
    git fetch origin acc582041eacdac00f1ca25059248df214dc68e6  && \ 
    cd /opt && \
    git clone https://github.com/reactorlabs/rir.git && \
    cd rir && \
    git checkout ac583eacf191f91d1a82c54b0f38f15d148cacf9 && \
    mkdir build && \
    mkdir build/release && \
    cd build/release && \
    (CC=gcc-8 CXX=g++-8 cmake -GNinja -DCMAKE_BUILD_TYPE=release -DFORCE_COLORED_OUTPUT=true ../.. || true) && \
    cmake ../.. && \
    ninja setup && \
    CC=gcc-8 CXX=g++-8 cmake -GNinja -DCMAKE_BUILD_TYPE=release -DFORCE_COLORED_OUTPUT=true ../.. && \
    ninja 
  