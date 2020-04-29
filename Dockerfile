FROM alpine:3.11

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh

RUN wget https://github.com/cloudreve/Cloudreve/releases/download/3.0.0/cloudreve_3.0.0_linux_arm.tar.gz
RUN tar -zxvf cloudreve_3.0.0_linux_arm.tar.gz -C /root/cloudreve
RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh
