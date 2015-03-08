# Naoki Rinmous' Shadowsocks Toolkit

## Docker Deployment File / Dockerfile

### Introduction

This docker file will build a CentOS environment on your local Docker, and clone source repo from GitHub (shadowsocks-libev).

Then checkout the latest tagged commit, and compile **shadowsocks-libev** with Clang & LLVM.

### Usage

    # docker build .
    Successfully built b6bbe4d695d0
    # docker run --net=host b6bbe4d695d0 \
        ss-server -p <port> -k <password> -m <method> -v -u --fast-open

Replace these parameters with your needs, it will come to work, and **--net=host** makes networking easier without mapping ports.

You may need **GNU screen**, **init script** or **systemd** to make it running in background.

## System Parameters / sysctl.conf

This profile will optimize your server for brust TCP connections, high congression network.

Put it in **/etc/sysctl.conf** or **/etc/sysctl.d/98-shadowsocks.conf**, then use **sysctl -p --system** to make it active.

You may use **modprobe tcp_htcp** to load HTCP congression control module.

---

More're coming soon :-3

