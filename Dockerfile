#FROM quay.io/prometheus/node-exporter:v1.8.1@sha256:fa7fa12a57eff607176d5c363d8bb08dfbf636b36ac3cb5613a202f3c61a6631 as builder
#RUN dnf -y install golang

#WORKDIR /go/src/mikefarah/yq

#COPY yq/ .

FROM registry.redhat.io/odf4/cephcsi-rhel9:v4.18.3@sha256:c34a314a813dee8be21cd579eb56e11e391f39026ced904e5f95afec00527481 as builder4


RUN CGO_ENABLED=0 go build -ldflags "-s -w" .

# RUN ./scripts/test.sh -- this too often times out in the github pipeline.
RUN ./scripts/acceptance.sh