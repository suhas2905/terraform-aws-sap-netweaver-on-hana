output "server_private_ip_dr" {
  value = module.instance.private_ip
}


output "overlay_ip_dr" {
  value = var.destination_cidr_block_for_overlay_ip
}


output "overlay_route_table_id_dr" {
  value = aws_route_table.private_route_table.id
}
  
output "my_pc_1" {
  value = aws_vpc_peering_connection.my_pc_1.id
}


