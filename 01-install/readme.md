
## Configuration

### HELM
helm init

kubectl create serviceaccount --namespace kube-system tiller

kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

helm init --service-account tiller --upgrade

Make sure you are a cluster admin.

### GCP Cluster admin config
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)

In values.yaml

1. defaultRules - Set as needed
2. search for storageClassName and put your storage classname instead
3. Change storage requests to any amount you want (default 10GB Prometheus, 2GB Alert Manager)
4. additionalScrapeConfigs: to scrape additional data like kubernetes up time of services

## Install
kubectl create ns monitoring
helm install stable/prometheus-operator --name prom-operator --values values.yaml --namespace monitoring


## forward services

kubectl port-forward svc/prom-operator-prometheus-o-prometheus  9090 -n monitoring
kubectl port-forward svc/prom-operator-prometheus-o-alertmanager  9093 -n monitoring
kubectl port-forward svc/prom-operator-grafana  3000:80 -n monitoring