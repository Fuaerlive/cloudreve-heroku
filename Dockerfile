FROM alpine:3.11

ARG CLOUDREVE_VERSION="3.0.0"

RUN cd /root/ \
    && wget https://github.com/cloudreve/Cloudreve/releases/download/$CLOUDREVE_VERSION/cloudreve_$CLOUDREVE_VERSION_linux_amd64.tar.gz


ADD mycloudreve.ini /root/Cloudreve/mycloudreve.ini
ADD run.sh /root/Cloudreve/run.sh
RUN chmod +x /root/Cloudreve/cloudreve
RUN chmod +x /root/Cloudreve/run.sh
CMD /root/Cloudreve/run.sh
