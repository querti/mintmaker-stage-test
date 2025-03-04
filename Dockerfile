#FROM quay.io/prometheus/node-exporter:v1.8.1@sha256:fa7fa12a57eff607176d5c363d8bb08dfbf636b36ac3cb5613a202f3c61a6631 as builder
#RUN dnf -y install golang

#WORKDIR /go/src/mikefarah/yq

#COPY yq/ .

FROM registry.redhat.io/odf4/cephcsi-rhel9:v4.17.5@sha256:1c96902fa14871fd6d25d7f33cd07ab31d1d3de6cc8ac0af1607bca6f7299a90 as builder4


RUN CGO_ENABLED=0 go build -ldflags "-s -w" .

# RUN ./scripts/test.sh -- this too often times out in the github pipeline.
RUN ./scripts/acceptance.sh