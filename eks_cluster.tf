locals {
  cluster_name = "eks-cluster-${var.name}-${data.aws_region.current.name}"
}

module "eks_cluster" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.25.0"

  cluster_name                    = local.cluster_name
  cluster_version                 = "1.22"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  subnet_ids = [aws_subnet.private[0].id, aws_subnet.private[1].id, aws_subnet.private[2].id]
  vpc_id     = aws_vpc.main.id

  enable_irsa = true

  eks_managed_node_group_defaults = {
    ami_type       = "BOTTLEROCKET_x86_64"
    instance_types = ["t2.micro", "t2.small"]

    attach_cluster_primary_security_group = false
    vpc_security_group_ids                = [aws_security_group.allow-web-traffic.id]
  }

  eks_managed_node_groups = {
    jenkins = {
      ami_type       = "BOTTLEROCKET_x86_64"
      platform       = "bottlerocket"
      instance_types = ["t2.small"]
      desired_size   = 1
      min_size       = 1
      max_size       = 10
      capacity_type  = "SPOT"
      labels = {
        Name = "jenkins-${var.name}-${data.aws_region.current.name}"
      }
      tags = merge(var.tags, {
        "Name" = "jenkins-${var.name}-${data.aws_region.current.name}"
      })
    }

    emissary-ingress = {
      ami_type       = "BOTTLEROCKET_x86_64"
      platform       = "bottlerocket"
      instance_types = ["t2.micro"]
      desired_size   = 1
      min_size       = 1
      max_size       = 10
      capacity_type  = "SPOT"
      labels = {
        Name = "emissary-ingress-${var.name}-${data.aws_region.current.name}"
      }
      tags = merge(var.tags, {
        "Name" = "emissary-ingress-${var.name}-${data.aws_region.current.name}"
      })
    }
  }

  tags = merge(var.tags, {
    "Name" = "eks-cluster-${var.name}-${data.aws_region.current.name}"
  })
}

