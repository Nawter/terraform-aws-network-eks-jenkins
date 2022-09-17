# Salla Network Environment

This module creates a networked environment consisting of two subnets for each Availability Zone, and places
AWS services, NAT Gateway and Internet Gateway into the environment.

1. ~~create two subnets(public, private)in one azs~~
2. ~~create the vpc with 6 subnets each one in three azs~~
3. ~~create eks with 2 node groups, one micro and other small, communications(sg only inside private subnets)~~
4. ~~deploy jenkins in small using helm and terraform~~
5. emissary-ingess in the micro using helm and terraform.
6. expose jenkins using emissary-ingress enabling https with wildcard host
7. build automation using github actions, by creating three envs(dev, staging, prod)

