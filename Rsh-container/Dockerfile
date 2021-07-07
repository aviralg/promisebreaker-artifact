FROM registry.gitlab.com/rirvm/rir_mirror/benchmark:ac583eacf191f91d1a82c54b0f38f15d148cacf9
ADD run.sh /opt/run.sh
CMD /opt/run.sh

RUN curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10.tar.xz > /tmp/llvm.tar.xz && \
    cd /opt/rir && \
    tar xf /tmp/llvm.tar.xz && \
    rm /tmp/llvm.tar.xz && \
    ln -s clang+llvm-11.1.0-x86_64-linux-gnu-ubuntu-20.10/ llvm-11 && \
    git init && \
    git remote add origin https://github.com/reactorlabs/rir.git && \
    (git fetch origin || true) && \
    git submodule update --init && \
    cd /opt/rir/external && \
    cd /opt/rir/build/release && \
    cmake ../..
