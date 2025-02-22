variable "vpc_cidr" {
  description = "(Required) VPC_CIDR range is required to create vpc"
  default     = ""
}
variable "vpc_cidr_region" {
  description = "(Required) VPC_CIDR_REGION is the VPC_CIDR of the region one(ex.us-east-1) to create route in route table for peering connection"
  default     = ""
}
variable "private_subnets_cidr" {
  description = "(Required) to create private subnets requires CIDR range"
  default     = ""
}

variable "public_subnets_cidr" {
  description = "(Required) to create public subnets reuires CIDR range"
  default     = ""
}


variable "availability_zones" {
  description = "(Required) to create subnets in diffrent AZ's"
  default     = ""
}

variable "enabled" {
  default     = true
  description = "(Optional) Enable the provisioning of resources of the module or not"
  type        = bool
}

# EC2 Instance Parameters
variable "instance_count" {
  default     = 1
  description = "(Optional) Number of instances to be provisioned. In case of scale up scenario - use 2 for HA. "
}

variable "is_scale_out" {
  default     = false
  description = "(Optional) Defines whether Shared disk should be create as a EFS file system"
}

variable "instance_type" {
  description = "(Required) Identifies the instance types to be used for HANA. Should be from the list of certified instances, since the disk sizing is done based on this"
}

variable "ebs_optimized" {
  description = "(Optional) Defines whether instance should be EBS optimized"
  default     = true
}
variable "default_instance_role" {
  description = "(Optional) Flag to define whether default instance role should be created"
  default     = false
}
variable "iam_instance_role" {
  description = "(Optional) The IAM role name to be attached to instance profile"
  default     = ""
}
variable "kms_key_arn" {
  description = "(Optional) KMS Key to be used for EBS volume encryption. If none is provisioned - volumes will not be encrypted"
  default     = ""
}
variable "user_data" {
  description = "(Optional) The user data script for the instance. If none provisioned - default one will be used to install AWS CLI and SSM agent"
  default     = ""
}

variable "enable_ha" {
  default     = false
  description = "(Optional) Defines how many instances should be deployed"
  type        = bool
}

# Networking Variables
variable "vpc_id" {
  description = "(Required) VPC to deploy HANA infrastructure to"
}

variable "subnet_ids" {
  default     = "aws_subnet.private_subnet[0].id"
  description = "(Required) List of subnets for instance distribution"
}

variable "dns_zone_name" {
  default     = ""
  description = "(Optional) The name of Route53 Private DNS zone. If not provided - DNS record will not be created"
}
#variable "customer_default_sg_id_dr" {
#  default     = []
#  description = "(Optional) List of preexisting security groups to be attached to the instance. The required security groups are created automatically, this is just for mandatory default ones"
#}
variable "customer_cidr_blocks_dr" {
  default     = ""
  description = "(Optional) The CIDR blocks to allow end-user connectivity from"
}
variable "destination_cidr_block_for_overlay_ip" {
  default     = "192.168.10.13/32"
  description = "(Required when HA) The IP to add as an overlay IP on Route tables. Example: 192.168.10.10/32"
}
variable "efs_security_group_id" {
  type        = string
  description = "(Optional) The security group for EFS file system to allow the mount. Required if EFS is used for /sapmnt"
  default     = ""
}

# OS Parameters
variable "ami_id" {
  description = "(Required) The AMI id for the underlying OS"
}
variable "ssh_key" {
  description = "(Optional) The key pair name for the instances. If not provided - you can use SSM session manager for console access"
  default     = ""
}


# HANA Sizing
variable "root_volume_size" {
  default     = 50
  description = "(Optional) Size in GBs for the root volumes of the instances"
}
variable "hana_disks_data_storage_type" {
  default     = "gp3"
  description = "(Optional) EBS Volume type for hana data volumes. Can be gp2 or io1"
}
variable "hana_disks_logs_storage_type" {
  default     = "gp3"
  description = "(Optional) EBS Volume type for hana log volumes. Can be gp2 or io1"
}
variable "hana_disks_backup_storage_type" {
  default     = "st1"
  description = "(Optional) EBS Volume type for hana backup volumes."
}
variable "hana_disks_shared_storage_type" {
  default     = "gp3"
  description = "(Optional) EBS Volume type for hana shared volumes."
}
variable "hana_disks_shared_size" {
  default     = "512"
  description = "(Optional) Size in GBs for the hana shared volumes of the instances"
}
variable "hana_disks_usr_sap_storage_type" {
  default     = "gp3"
  description = "(Optional) EBS Volume type for hana /usr/sap volumes. "
}
variable "hana_disks_usr_sap_storage_size" {
  default     = "50"
  description = "(Optional) Size in GBs for the /usr/sap volumes of the instances"
}

variable "sid" {
  description = "(Required) The System id for the HANA system"
}
variable "environment" {
  description = "(Required) Environment type for HANA system, e.x. 'dev', 'test', 'prod'"
}
variable "application_code" {
  description = "(Required) The unique application code for resource naming"
}
variable "application_name" {
  description = "(Required) The name of the application being provisioned, ex. 'datamart', 'ecc', 's4hana', etc."
}


