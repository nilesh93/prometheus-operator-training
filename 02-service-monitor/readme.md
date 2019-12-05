# ServiceMonitor

Service Monitor allows you to poll and extract metrics from a given endpoint and store the data in prometheus

DEBUGGING - Prometheus -> status -> targets

kubectl get servicemonitor --all-namespaces

## Scenario

You have a HAProxy running on a VM with IP 192.168.10.15 and this is not a part of the k8s cluster. You want to install node-exporter here and export metrics to the prometheus server running inside k8s