FROM golang:1.14.1-alpine3.11 as builder

ARG CLOUDREVE_VERSION="3.0.0"

WORKDIR /ProjectCloudreve
RUN apk update \
    && apk add git yarn build-base gcc abuild binutils binutils-doc gcc-doc

RUN cd /root/ \
    && git clone --recurse-submodules https://github.com/cloudreve/Cloudreve.git

RUN cd /root/Cloudreve/assets \
    && yarn install --network-timeout 1000000 \
    && yarn run build

RUN cd /root/Cloudreve \
    && go get github.com/rakyll/statik \
    && statik -src=assets/build/ -include=*.html,*.js,*.json,*.css,*.png,*.svg,*.ico -f \
    && git checkout ${CLOUDREVE_VERSION} \
    && export COMMIT_SHA=$(git rev-parse --short HEAD) \
    && go build -a -o cloudreve-main -ldflags " -X 'github.com/HFO4/cloudreve/pkg/conf.BackendVersion=$CLOUDREVE_VERSION' -X 'github.com/HFO4/cloudreve/pkg/conf.LastCommit=$COMMIT_SHA'"

ADD mycloudreve.ini /root/Cloudreve/mycloudreve.ini
ADD run.sh /root/Cloudreve/run.sh
RUN chmod +x /root/Cloudreve/cloudreve
RUN chmod +x /root/Cloudreve/run.sh
CMD /root/Cloudreve/run.sh
