resource "aws_subnet" "private_subnet" {
    count                   = length(var.private_subnets_cidr) 
    vpc_id                  = aws_vpc.SAP_VPC[0].id
    cidr_block              = element(var.private_subnets_cidr , count.index) 
    availability_zone       = element(var.availability_zones , count.index)
    map_public_ip_on_launch = false


    tags = {

        Name = "Private-Subnet-${count.index + 1}"
    }
}

resource "aws_subnet" "public_subnet" {
    count                   = length(var.public_subnets_cidr) 
    vpc_id                  = aws_vpc.SAP_VPC[0].id
    cidr_block              = element(var.public_subnets_cidr , count.index) 
    availability_zone       = element(var.availability_zones , count.index)
    map_public_ip_on_launch = true


    tags = {

        Name = "Public-Subnet-${count.index + 1}"
    }
}
