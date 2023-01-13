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