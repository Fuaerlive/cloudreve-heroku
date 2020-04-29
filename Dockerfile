FROM alpine:3.9.5

ADD cloudreve /root/cloudreve/cloudreve
ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh

RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh
CMD /root/cloudreve/run.sh
