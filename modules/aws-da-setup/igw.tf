resource "aws_internet_gateway" "igw" {

    vpc_id = aws_vpc.SAP_VPC[0].id


    tags = {

        Name = "My-IGW"
    }
}