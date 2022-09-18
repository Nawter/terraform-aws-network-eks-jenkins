# Salla Network Environment Challenge

This module creates a networked environment consisting of two subnets for each Availability Zone, and places
AWS services, NAT Gateway and Internet Gateway into the environment.

1. ~~create two subnets(public, private)in one azs~~
2. ~~create the vpc with 6 subnets each one in three azs~~
3. ~~create eks with 2 node groups, one micro and other small, communications(sg only inside private subnets)~~
4. ~~deploy jenkins in small using helm and terraform~~
5. emissary-ingess in the micro using helm and terraform.
6. expose jenkins using emissary-ingress enabling https with wildcard host
7. build automation using github actions, by creating three envs(dev, staging, prod)



 We couldn't finish the three last point in time because of the following reasons
 1. we deployed the module emissary-ingress using terraform and helm, but we couldn't make it in the specific node. 
You can see it in the file ambassador_crd.tf and emissary_ingress_values.yaml, the error is terraform can't create it
because of namespace errors
 2. we try to deploy the resource emissary-ingress using different module, but there is a lot of an errors, one of the them is terraform can't find
the url to download the yaml file
 3. Our last try is using helm directly without terraform and we succeeded in deploying the chart into kubernets, but when we 
tried to change the file emissary_ingress_values_2nd_attempt.yaml, and make the deployment manually through the yaml file we couldn't finish it 
because of errors.

For the Jenkins Part we need to follow the next instructions:

1. aws eks --region us-east-1 update-kubeconfig --name eks-cluster-dev-env-us-east-1
2. export KUBE_CONFIG_PATH="the path generated in the last step"

 