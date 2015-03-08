FROM centos

# Enable EPEL repo
RUN yum install -y epel-release && \
    yum install -y openssl-devel git clang llvm gcc make

# Retrive sources
WORKDIR /usr/local/src
RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git && \
    cd shadowsocks-libev && \
    rev=$(git tag | tail -n 1) && \
    git checkout $rev

# Compile and Install
WORKDIR /usr/local/src/shadowsocks-libev
RUN CC=clang CFLAGS="-march=native -O2 -pipe" CPPFLAGS=$CFLAGS ./configure \
      --enable-static \
      --prefix=/usr/local/
RUN make && make install
