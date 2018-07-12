FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y libboost-dev \
                    libboost-test-dev \
                    libboost-program-options-dev \
                    libboost-filesystem-dev \
                    libboost-thread-dev \
                    libevent-dev \
                    automake \
                    libtool \
                    flex \
                    bison \
                    pkg-config \
                    g++ \
                    libssl-dev \
                    build-essential \
                    wget && \
    wget http://apache.belnet.be/thrift/0.10.0/thrift-0.10.0.tar.gz && \
    tar -xvzf thrift-0.10.0.tar.gz && \
    cd thrift-0.10.0 && ./configure && make && make install

RUN cd / && tar czpf thrift-0.10.0-bin.tar.gz /usr/local/bin/thrift /usr/local/lib/libthrift* /usr/local/include/thrift/ /usr/local/lib/pkgconfig/thrift*

