variable "name" {
  description = "The name of the networked environment. Example region-dev-eks"
  type        = string
}

variable "region" {
  type        = string
  description = "The AWS region for the provider to deploy resources into."
}

variable "cidr_block" {
  type        = string
  description = "The IP address range of the environment in CIDR notation."
}

variable "public_cidr_block" {
  type        = list(string)
  description = "The CIDR block for 'public network'"
}

variable "private_cidr_block" {
  type        = list(string)
  description = "The CIDR block for private network"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "The tags for the resources in the environment."
}

variable "availability_zones" {
  type        = list(any)
  description = "The availability zones for the environment. Examples: eu-west-1a, eu-west-1b"
}

variable "num_nat_gateways" {
  type        = number
  description = "The number of NAT Gateways required for the environment. For dev and test this should not be more than 1. For Production, this should equal the number of availability zones. Only appliable for VPCs with an internet gateway"
}

variable "cluster_version" {
  type        = string
  description = "The version of the EKS cluster."
}

variable "jenkins_admin_user" {
  type        = string
  description = "Admin user of the Jenkins Application."
}

variable "jenkins_admin_password" {
  type        = string
  description = "Admin password of the Jenkins Application."
}

variable "group_instance_type" {
  type        = list(string)
  description = "The instance type of the worker group nodes. Must be large enough to support the amount of NICS assigned to pods."
}

variable "group_ami_type" {
  type        = string
  description = "The ami type of the worker group nodes"
}

variable "group_platform_type" {
  type        = string
  description = "The platform type of the worker group nodes"
}

variable "group_min_size" {
  type        = number
  description = "The minimum number of nodes"
}

variable "group_desired_size" {
  type        = number
  description = "The desired number of nodes"
}

variable "group_max_size" {
  type        = number
  description = "The maximum number of nodes"
}

variable "group_capacity_type" {
  type        = string
  description = "The instance capacity type, it could be spot, on-demand or dedicated"
}
