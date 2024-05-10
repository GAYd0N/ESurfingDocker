FROM ubuntu:22.04

ADD GDClient* /
ADD esurfing.sh /linux-client-2.4-64

WORKDIR /linux-client-2.4-64

ENV TZ=Asia/Shanghai

RUN echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse' >> /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install curl iproute2 -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get clean \
    && chmod -R u+x /root \
    && ./tyxy \
    && rm -rf /var/lib/apt/lists/*

CMD ["./esurfing.sh"]