#creating route table
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.SAP_VPC[0].id
    route {

        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway[0].id
    }
	    route {

        cidr_block = "10.200.0.0/16"
        vpc_peering_connection_id = pcx-0d02ba7cbad116eaa
    }
    tags = {

        Name = "My-Private-Routing-Table"
    }

}
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.SAP_VPC[0].id
    route {

        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {

        Name = "My-Public-Routing-Table"
    }

}
