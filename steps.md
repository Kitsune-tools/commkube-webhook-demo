```
./deployment/webhook-create-signed-cert.sh \
    --service sidecar-injector-webhook-svc \
    --secret sidecar-injector-webhook-certs \
    --namespace default
```
# Create mwh-ca-bundle.yaml
```
cat deployment/mutatingwebhook.yaml | \
    deployment/webhook-patch-ca-bundle.sh > \
    deployment/mutatingwebhook-ca-bundle.yaml
```

# Deploy our webhook server
```
kubectl create -f deployment/nginxconfigmap.yaml
kubectl create -f deployment/configmap.yaml
kubectl create -f deployment/deployment.yaml
kubectl create -f deployment/service.yaml
```

# Deploy Webhook
```kubectl create -f deployment/mutatingwebhook-ca-bundle.yaml```




kubectl create ns demo

kubectl apply -f sleep-pod.yaml

kubectl label ns demo sidecar-injector=enabled