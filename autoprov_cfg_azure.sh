#!/bin/bash
#autoprov_cfg initialization scirpt for Azure VMSS by Jayden Aung

mgmt_name="azuremgmtr8010"
my_tn="cloudguardvmss"

# SIC
my_sic="your-sic-password"

# If you use keyvault to store your SIC key
# export my_sic=$(az keyvault secret show --vault-name $keyvault_name --name my-sic-key | jq -r '.value')

ver="R80.40"
policy="vmss"
my_cn="Azure-Prod"
keyvault_name="your-key-vault-name"

#Azure subscription ID
subscription="YOUR AZURE SUBSCRIPTIONS"

#Active Directory Tenant ID
my_at="YOUR AD/TENANT ID"

#Application ID or Client ID
my_aci="APPLICATION ID"

#Client Secret (If you use keyvault)
#secret="yoursecret"
#export my_acs=$(az keyvault secret show --vault-name $keyvault_name --name $secret | jq -r '.value')

# If you don't use keyvault
my_acs="your-client-secret"

echo Initializating auto provisioning script ..

autoprov_cfg init Azure -mn $mgmt_name -tn $my_tn \
-otp $my_sic \
-ver $ver -po $policy -cn $my_cn \
-sb $subscription \
-at $my_at \
-aci $my_aci \
-acs $my_acs

## Follow up
#autoprov_cfg set template -tn $my_tn -ips -uf -ab -av -appi -ia -hi
#autoprov-cfg set template -tn $my_tn -hi