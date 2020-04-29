FROM golang:1.14.1-alpine3.11

WORKDIR /ProjectCloudreve

RUN apk update \
    && apk add git yarn build-base gcc abuild binutils binutils-doc gcc-doc

RUN git clone --recurse-submodules https://github.com/cloudreve/Cloudreve.git

RUN cd ./Cloudreve/assets \
    && yarn install --network-timeout 1000000 \
    && yarn run build

RUN cd ../ \
    && go get github.com/rakyll/statik \
    && statik -src=assets/build/ -include=*.html,*.js,*.json,*.css,*.png,*.svg,*.ico -f \
    && git checkout ${CLOUDREVE_VERSION} \
    && export COMMIT_SHA=$(git rev-parse --short HEAD) \
    && go build -a -o cloudreve-main -ldflags " -X 'github.com/HFO4/cloudreve/pkg/conf.BackendVersion=$CLOUDREVE_VERSION' -X 'github.com/HFO4/cloudreve/pkg/conf.LastCommit=$COMMIT_SHA'"


FROM alpine:3.11

ADD mycloudreve.ini /root/cloudreve/mycloudreve.ini
ADD run.sh /root/cloudreve/run.sh
COPY --from=builder /ProjectCloudreve/Cloudreve/cloudreve /root/cloudreve
RUN chmod +x /root/cloudreve/cloudreve
RUN chmod +x /root/cloudreve/run.sh

CMD /root/cloudreve/run.sh
