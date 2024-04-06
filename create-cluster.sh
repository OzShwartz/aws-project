# create eks
eksctl create cluster \
--name oz-cluster \
--version 1.28 \
--region eu-west-1 \
--nodegroup-name linux-nodes \
--node-type t2.micro \
--nodes 3

# update config
aws eks update-kubeconfig --region eu-west-1 --name oz-cluster

# install grafana helm chart on name space dev
kubectl create ns dev
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install dev-prometheus prometheus-community/prometheus --version 25.19.0 --namespace dev

# inmport the garfana helm chart sturcture 
# helm repo add grafana https://grafana.github.io/helm-charts
# helm fetch grafana/grafana
# tar -zxvf grafana-7.3.7.tgz



