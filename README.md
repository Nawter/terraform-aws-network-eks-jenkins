# How to Build Kubernets Cluster with Jenkins using Terraform and HELM 

This module creates a networked environment consisting of two subnets for each Availability Zone, and places
AWS services, NAT Gateway and Internet Gateway into the environment.

1. create two subnets(public, private)in one azs
2. create the vpc with 6 subnets each one in three azs
3. create eks with 2 node groups, one micro and other small, communications(sg only inside private subnets)
4. deploy jenkins in small using helm and terraform


1. aws eks --region us-east-1 update-kubeconfig --name eks-cluster-dev-env-us-east-1
2. export KUBE_CONFIG_PATH="the path generated in the last step"

 
