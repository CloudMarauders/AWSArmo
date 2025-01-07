variable "requester_transit_gateway_id" {
  description = "Transit Gateway ID in Tokyo"
  type        = string
}

variable "accepter_transit_gateway_id" {
  description = "Transit Gateway ID in another region"
  type        = string
}

variable "requester_region" {
  description = "Region of the Tokyo Transit Gateway"
  type        = string
}

variable "accepter_region" {
  description = "Region of the regional Transit Gateway"
  type        = string
}

variable "name" {
  description = "Name for the peering connection"
  type        = string
}