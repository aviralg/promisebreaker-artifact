FROM registry.gitlab.com/rirvm/rir_mirror/benchmark:ac583eacf191f91d1a82c54b0f38f15d148cacf9
ADD run.sh /opt/run.sh
ADD promisebreaker-graphs /opt/paper

CMD /opt/run.sh

RUN rm -rf /opt/rir && \
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
  