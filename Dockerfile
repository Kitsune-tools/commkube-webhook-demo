FROM alpine:latest

ADD commkube-webhook-demo /commkube-webhook-demo
ENTRYPOINT ["./commkube-webhook-demo"]