/*
module "ns_vpc" {
    source                     = "./modules/vpc"
    vpc_tag_name               = "ns_vpc"     
    vpc_cidr_block             = "172.31.0.0/16"
    availability_zones         = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
    private_subnet_cidr_blocks = ["172.31.0.0/20", "172.31.80.0/20"]  
    public_subnet_cidr_blocks  = ["172.31.16.0/20", "172.31.32.0/20"]
    region                     = "us-east-1"
}
*/

module "ns_eks" {
    source                     = "./modules/eks"
    eks_cluster_name           = "NS_cluster"
    eks_cluster_subnet_ids     = ["subnet-06b6078f5d696cb02", "subnet-0a9b2447e7d945fef", "subnet-0c58daa572b481d4e", "subnet-069409343f8b41b20"]
    cluster_sg_name            = "ns_security_group"
    endpoint_private_access    = "true"
    endpoint_public_access     = "false"
}

module "ns_nodegroup" {
    source                     = "./modules/nodegroups"
    node_group_name            = "Ns-node-group"
    cluster_name               = module.ns_eks.cluster_name
    vpc_id                     = "vpc-03e64f505607a67f8"
    private_subnet_ids         = ["subnet-06b6078f5d696cb02", "subnet-0a9b2447e7d945fef"]
    public_subnet_ids          = ["subnet-0c58daa572b481d4e", "subnet-069409343f8b41b20"]
    ami_type                   = "AL2_x86_64"
    disk_size                  = 20
    instance_types             = ["t3.medium"]
    pvt_desired_size           = 2
    pvt_max_size               = 2
    pvt_min_size               = 2
    #pblc_desired_size         = 1
    #pblc_max_size             = 1
    #pblc_min_size             = 1
    nodes_sg_name              = "new_node_group_security"
    source_security_group_id   = module.ns_eks.cluster_sg
}