FROM ubuntu:22.04

ADD GDClient* /

WORKDIR /linux-client-2.4-64

RUN echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse' >> /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install curl iproute2 -y \
    && apt-get clean \
    && chmod -R u+x /root \
    && ./tyxy \
    && rm -rf /var/lib/apt/lists/*

CMD ["./ESurfingSvr", "$ESURFING_USER", "$ESURFING_PASSWORD"]