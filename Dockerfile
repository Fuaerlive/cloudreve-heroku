FROM alpine:3.11

ARG CLOUDREVE_VERSION="3.0.0"

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh

RUN wget https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_amd64.tar.gz
RUN tar -zxvf cloudreve_3.0.0_linux_amd64.tar.gz -C /root/cloudreve
RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh

RUN mkdir /lib64
RUN ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

CMD /root/cloudreve/run.sh
