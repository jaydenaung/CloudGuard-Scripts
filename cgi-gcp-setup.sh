#!/bin/bash

# *********************************************************
# A simple script to deploy Check Point CloudGuard on GCP 
# Author: Jayden Kyaw Htet Aung 
# See LICENSE and README files
# **********************************************************

#UPDATE THE FOLLOWING:
#UPDATE THIS: PROJECT NAME/ID
PROJECT_ID="myproject1234"

#UPDATE THIS WITH THE IMAGE THAT YOU WISH TO DEPLOY
cgiimage="check-point-r8040-payg-294-759-v20201202"

#UPDATE THIS: SERVICE ACCOUNT
svaccount="cloudguard@myproject1234.iam.gserviceaccount.com"

#UPDATE THIS: Front End VPC
vpc1="lab-vpc-sea"

#UPDATE THIS: Front End Subnet"
subnet1="sea-pub-1"

#UPDATE THIS: Front End Private IP
front_private_ip="10.0.0.10"

#UPDATE THIS: Back End VPC
vpc2="spoke-vpc-a-singapore"

#UPDATE THIS: Back End Subnet 1
subnet2="spoke-a-public-1"

#UPDATE THIS: Back End Private IP
back_private_ip="10.4.0.10"

#UPDATE THIS: NAME OF THE GATEWAY VM
gwname="cg-gateway"

#UPDATE THIS: ZONE
GCPZone="asia-southeast1-a"

#UPDATE THIS: BOOT DISK SIZE in GB. IT SHOULD BE LARGER THAN 100 GB.
bootdisksize="150"

#UPDATE THIS: BOOT DISK TYPE. IF UNSURE, LEAVE IT AS IT IS.
bdtype="pd-standard"

#UPDATE THIS: MACHINE TYPE. IF UNSURE, LEAVE IT AS IT IS.
machinetype="n1-standard-2"

gcloud compute instances create $gwname --zone $GCPZone \
--can-ip-forward --project $PROJECT_ID --boot-disk-size $bootdisksize --boot-disk-type $bdtype \
--boot-disk-device-name $gwname --machine-type $machinetype --service-account $svaccount --tags "checkpoint-gateway" \
--network-interface network=$vpc1,subnet=$subnet1,private-network-ip=$front_private_ip \
--network-interface network=$vpc2,subnet=$subnet2,private-network-ip=$back_private_ip,no-address \
--scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
--maintenance-policy "MIGRATE" --min-cpu-platform "Automatic" --image $cgiimage --image-project "checkpoint-public"

echo "Your CGI Gateway has been created on `date`!"
