FROM centos:7
RUN yum install epel-release -y && \
    # yum groupinstall 'Development Tools' -y && \
    yum install gcc make -y && \
    yum install mosquitto-devel libcurl-devel lua-devel libsodium-devel libconfig-devel lmdb-devel libuuid-devel wget -y
ADD build.sh /usr/local/bin/build.sh
WORKDIR /work
ENTRYPOINT /usr/local/bin/build.sh
