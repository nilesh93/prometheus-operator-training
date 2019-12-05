helm install --name blackbox-exporter --namespace monitoring stable/prometheus-blackbox-exporter

to use this,
in your services you should add the annotation
annotations:
    prometheus.io/probe: "true"

or use the kkubectl

kubectl annotate svc svc-name prometheus.io/probe=true
kubectl annotate svc svc-name prometheus.io/probe-path=/healthz

# probe-path is the health endpoint which should return HTTP GET status 200