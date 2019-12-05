kubectl create secret generic alertmanager-prom-operator-prometheus-o-alertmanager --from-file=alertmanager.yaml -n monitoring --dry-run -o yaml > alertmanager-secret.yaml

kubectl apply -f alertmanager-secret.yaml -n monitoring