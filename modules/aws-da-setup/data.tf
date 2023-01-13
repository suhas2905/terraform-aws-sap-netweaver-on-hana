data "aws_region" "current" {}

data "aws_route53_zone" "dns_zone" {
  name         = var.dns_zone_name
  private_zone = true
}

#data "aws_vpc" "vpc" {
#  id = var.vpc_id
#}
