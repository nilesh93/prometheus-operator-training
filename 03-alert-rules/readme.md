# PrometheusRule


## Querying
node_filesystem_avail_bytes{instance="10.128.15.224:9100", device="/dev/root"}


## Configuration
UPDATE: k8s 1.11.4

 kubectl delete MutatingWebhookConfiguration prom-operator-prometheus-o-admission

 kubectl delete ValidatingWebhookConfiguration  prom-operator-prometheus-o-admission

## apply

kubectl apply -f up-rule.yaml

kuebctl get prometheusrule