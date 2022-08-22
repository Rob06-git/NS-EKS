
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  default = "ns_cluster"
  type = string
}

variable cluster_sg_name {
  description = "Name of the EKS cluster Security Group"
  default = "nsC_security_group"
  type        = string
}

variable "eks_cluster_subnet_ids" {
  type = list(string)
  default = ["subnet-06b6078f5d696cb02", "subnet-0a9b2447e7d945fef", "subnet-0c58daa572b481d4e", "subnet-069409343f8b41b20"]
  description = "List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane."
}

variable "endpoint_private_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "endpoint_public_access" {
  type = bool
  default = false
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable vpc_id {
  description = "VPC ID from which belongs the subnets"
  default     = "vpc-03e64f505607a67f8"
  type        = string
  
  
}
