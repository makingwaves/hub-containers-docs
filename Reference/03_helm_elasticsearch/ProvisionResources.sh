#!/usr/bin/env bash
set -x
set -e



for i in "$@"
do
case $i in
    -g=*|--resource-group=*)
    RESOURCE_GROUP="${i#*=}"
    shift # past argument
esac
done


if [ -z "$RESOURCE_GROUP" ]; then
    echo "missing arg -g|--resource-group"
    exit 1
fi


KEYVAULT_NAME="ElasticKeyVault"
LOCATION="westeurope"


SECURITY_OPERATOR_USER="ElasticSecurityOperator"
SECURITY_OPERATOR_PW="SimplePassword!"

DEPLOYMENT_OPERATOR_USER="ElasticDeploymentOperator"
DEPLOYMENT_OPERATOR_PW="SimplePassword!"

echo "checking if exists.."
az ad  app list  | grep  $SECURITY_OPERATOR_USER
if [ $? -eq 0 ]; then
    echo "SP $SECURITY_OPERATOR_USER allready exists"
else
    echo "Adding security operator"
    az ad sp create-for-rbac --name $SECURITY_OPERATOR_USER --password $SECURITY_OPERATOR_PW
fi

az ad  app list  | grep  $DEPLOYMENT_OPERATOR_USER
if [ $? -eq 0 ]; then
    echo "SP $DEPLOYMENT_OPERATOR_USER allready exists"
else
    echo "Adding deployment operator"
    az ad sp create-for-rbac --name $DEPLOYMENT_OPERATOR_USER --password $DEPLOYMENT_OPERATOR_PW
fi


# Create and set policies for the KeyVault

az keyvault show --name $KEYVAULT_NAME -g $RESOURCE_GROUP
if [ $? -eq 0 ]; then
    echo "Keyvault allready created"
else
    echo "Creating KeyVault"
    az keyvault create --name $KEYVAULT_NAME --resource-group $RESOURCE_GROUP
fi



SECURITY_OPERATOR_ID=$(az ad app show --id http://$SECURITY_OPERATOR_USER --query appId --output tsv)
az keyvault set-policy --object-id $SECURITY_OPERATOR_ID --name $KEYVAULT_NAME --resource-group $RESOURCE_GROUP --certificate-permissions create delete get import list update --key-permissions create delete get import list update --secret-permissions get delete list set

DEPLOYMENT_OPERATOR_ID=$(az ad app show --id http://$DEPLOYMENT_OPERATOR_USER --query appId --output tsv)
az keyvault set-policy --object-id $DEPLOYMENT_OPERATOR_ID --name $KEYVAULT_NAME --resource-group $RESOURCE_GROUP --secret-permissions get list

DNS_NAME="mwelastic"


az network public-ip show -n $DNS_NAME -g $RESOURCE_GROUP
if [ $? -eq 0 ]; then
    echo "Public ip allready exists"
else
    echo "creating static ip and domain name"
    az network public-ip create -n $DNS_NAME --resource-group=$RESOURCE_GROUP --allocation-method=static --dns-name=$DNS_NAME
fi

FULL_DNS=$(az network public-ip show -n $DNS_NAME -g $RESOURCE_GROUP --query dnsSettings.fqdn --output tsv)

echo "The full DNS is $FULL_DNS"

