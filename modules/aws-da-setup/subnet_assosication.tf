resource "aws_route_table_association" "private_sub" {

    count          = length(var.private_subnets_cidr)
    subnet_id      = element(aws_subnet.private_subnet.*.id , count.index)
    route_table_id = aws_route_table.private_route_table.id

}
resource "aws_route_table_association" "public_sub" {

    count          = length(var.public_subnets_cidr)
    subnet_id      = element(aws_subnet.public_subnet.*.id , count.index)
    route_table_id = aws_route_table.public_route_table.id

}
