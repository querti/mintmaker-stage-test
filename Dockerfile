#FROM quay.io/prometheus/node-exporter:v1.8.1@sha256:fa7fa12a57eff607176d5c363d8bb08dfbf636b36ac3cb5613a202f3c61a6631 as builder
#RUN dnf -y install golang

#WORKDIR /go/src/mikefarah/yq

#COPY yq/ .

FROM registry.redhat.io/odf4/cephcsi-rhel9:v4.15.5@sha256:159f59fbd3c29d82e0b3bc8093e46cd9f8af3e2baa5921ecd1f9082c3fc22d89 as builder4


RUN CGO_ENABLED=0 go build -ldflags "-s -w" .

# RUN ./scripts/test.sh -- this too often times out in the github pipeline.
RUN ./scripts/acceptance.sh