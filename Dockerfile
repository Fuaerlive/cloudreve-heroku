FROM alpine:3.11

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh

RUN wget -P /root/cloudreve/ https://github.com/Fuaerlive/cloudreve-heroku/raw/master/cloudreve
RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh
