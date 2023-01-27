resource "aws_vpc_peering_connection" "my_pc_1" {
  peer_vpc_id   = var.vpc_id
  vpc_id        = aws_vpc.SAP_VPC[0].id
  peer_region   = "us-east-1"
  tags = {
        Name = "my_pc_1_owner"
    }
}
