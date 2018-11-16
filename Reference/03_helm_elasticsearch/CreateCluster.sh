#!/usr/bin/env bash


for i in "$@"
do
case $i in
    -e=*|--environment-name=*)
    ENVIRONMENT="${i#*=}"
    shift # past argument
    ;;
    -n=*|--nodes=*)
    NODES="${i#*=}"
    shift # past argument
    ;;
esac
done


if [ -z "$ENVIRONMENT" ]; then
    echo "missing arg -e|--environment-name, need to know what name to assign to the environment"
    exit 1
fi

if [ -z "$NODES" ]; then
    NODES="3"
    echo "Number of nodes not specified, defaulting to 3."
fi

RESOURCEGROUP="Kubernetes${ENVIRONMENT}"
CLUSTERNAME="${ENVIRONMENT}Cluster"

#CREATE CLUSTER
az group create --name ${RESOURCEGROUP} --location westeurope
az aks create --resource-group ${RESOURCEGROUP} --name ${CLUSTERNAME} --node-count ${NODES}  --node-vm-size Standard_D2_v3 --generate-ssh-keys
az aks wait --resource-group ${RESOURCEGROUP} --name ${CLUSTERNAME} --created
# store credentials into azurecubes.conf, which needs to be commited to VCS for deployment to work
az aks get-credentials --resource-group ${RESOURCEGROUP} --name ${CLUSTERNAME} -f azurekubes.conf
# store credentials into local ~.kube/config for your convenience
az aks get-credentials --resource-group ${RESOURCEGROUP} --name ${CLUSTERNAME}

# configure helm RBAC serviceaccount
kubectl create -f Configurations/helm-rbac.yaml
helm init --service-account tiller

# enable dashboard cluster role binding
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard

echo "Success! "
echo "Now, you should be able to access the dashboard with 'az aks browse -n ${CLUSTERNAME} -g ${RESOURCEGROUP}'"
echo "Next, run ./UpdateCluster.sh -c=${CLUSTERNAME} -t=[tag number]"