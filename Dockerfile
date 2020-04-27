FROM alpine:3.11

ARG CLOUDREVE_VERSION="3.0.0"

ADD mycloudreve.ini /root/Cloudreve/mycloudreve.ini
ADD run.sh /root/Cloudreve/run.sh

RUN cd ./root/Cloudreve/ \
    && wget https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_amd64.tar.gz \
    && tar -zxvf cloudreve_3.0.0_linux_amd64.tar.gz

RUN chmod +x /root/Cloudreve/cloudreve
RUN chmod +x /root/Cloudreve/run.sh
CMD /root/Cloudreve/run.sh
