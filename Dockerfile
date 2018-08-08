FROM centos:7

RUN echo 'root:root' | chpasswd && \
    yum -y update && \
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y install git vim python36u python36u-libs python36u-devel python36u-pip && \
    pip3.6 install --upgrade pip && \
    pip3.6 install django && \
    mkdir /app && \
    echo foo > foo.txt && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.10.3/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/ && \
    useradd -m git
WORKDIR /app

CMD ["/bin/sh"]

