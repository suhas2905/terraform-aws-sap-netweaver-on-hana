resource "aws_vpc_peering_connection" "my_pc_1" {
  peer_vpc_id   = var.vpc_id
  vpc_id        = aws_vpc.SAP_VPC[0].id
  peer_region   = "us-east-2"
}
resource "aws_vpc" "SAP_VPC" {
    count                = 1
    cidr_block           = var.vpc_cidr
    enable_dns_support   = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink   = "false"
    instance_tenancy     = "default"    
    
    tags = {
        Name = "Sap_VPC"
    }
}
