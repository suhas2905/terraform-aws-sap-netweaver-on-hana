resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count = var.enabled == true ? 1 : 0
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = aws_subnet.public_subnet[0].id
  tags = {
    "Name" = "PrivateNatGateway"
  }
}
#split(flatten([[aws_subnet.private_subnet[0].id], [aws_subnet.private_subnet[1].id]]))