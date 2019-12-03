FROM centos:latest
ADD ./payload/kubectl /usr/bin/kubectl

ADD ./payload/* /usr/bin/

RUN mkdir -p /etc/hyperledger/fabric 

ADD ./core.yaml /etc/hyperledger/fabric 

ADD ./go1.12.5.linux-amd64.tar.gz /opt

RUN yum install jq -y

RUN mkdir /root/.kube 

ENV PATH /opt/go/bin:$PATH

ENV GOPATH /opt/gopath 

WORKDIR /root
