FROM alpine:3.11

ARG CLOUDREVE_VERSION="3.0.0"

RUN cd /root/ \
    && wget -q https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_amd64.tar.gz
    && tar -zxvf cloudreve_VERSION_OS_ARCH.tar.gz

ADD mycloudreve.ini /root/Cloudreve/mycloudreve.ini
ADD run.sh /root/Cloudreve/run.sh
RUN chmod +x /root/Cloudreve/cloudreve
RUN chmod +x /root/Cloudreve/run.sh
CMD /root/Cloudreve/run.sh
