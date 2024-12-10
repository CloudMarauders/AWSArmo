variable "name" {
  description = "Name tag for the VPC Peering Connection"
  type        = string
}

variable "requester_vpc_id" {
  description = "VPC ID of the requester VPC"
  type        = string
}

variable "accepter_vpc_id" {
  description = "VPC ID of the accepter VPC"
  type        = string
}

variable "requester_cidr_block" {
  description = "CIDR block of the requester VPC"
  type        = string
}

variable "accepter_cidr_block" {
  description = "CIDR block of the accepter VPC"
  type        = string
}

variable "requester_subnet_route_table_ids" {
  description = "Route table IDs for the requester's subnets"
  type        = list(string)
}

variable "accepter_subnet_route_table_ids" {
  description = "Route table IDs for the accepter's subnets"
  type        = list(string)
}

variable "accepter_region" {
  description = "Region of the accepter VPC"
  type        = string
}

variable "auto_accept" {
  description = "Whether to automatically accept the VPC peering connection"
  type        = bool
  default     = true
}