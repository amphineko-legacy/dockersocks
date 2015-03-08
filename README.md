# Naoki Rinmous' Shadowsocks Toolkit

## Docker Deployment File / Dockerfile

### Introduction

This docker file will make a CentOS environment, fetch source code from GitHub (shadowsocks-libev).
Then checkout the latest tagged commit, and compile with Clang & LLVM.

### Usage

    # docker build .
    Successfully built b6bbe4d695d0
    # docker run --net=host b6bbe4d695d0 \
        ss-server -p <port> -k <password> -m <method> -v -u --fast-open

Replace these parameter with your needs, it will fire up to work, and **--net=host** makes easier for networking without mapping ports.

---

More're coming soon :-3

