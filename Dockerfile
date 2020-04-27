FROM alpine:3.11

ARG CLOUDREVE_VERSION="3.0.0"

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh

RUN wget -P /root/cloudreve https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_amd64.tar.gz
RUN tar -zxvf cloudreve_3.0.0_linux_amd64.tar.gz
RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh
CMD /root/cloudreve/run.sh
