#!/bin/bash
#autoprov_cfg initialization scirpt for AWS by Jayden Aung

mgmt_name="awsmgmtr81"
my_tn="autoscaling"
my_sic="your-sic-key"
ver="R81"
policy="autoscaling"
my_cn="AWS-Prod"
region="ap-southeast-1"

echo Initializating auto provisioning script ..

autoprov_cfg init AWS -mn $mgmt_name -tn $my_tn -otp $my_sic \
-ver $ver \
-po $policy \
-cn $my_cn \
-r $region -iam

# autoprov-cfg set controller AWS -cn $my_cn -sg -slb


#autoprov_cfg set template -tn $my_tn -ips -uf -ab -av -appi -ia -hi
#autoprov-cfg set template -tn $my_tn -hi