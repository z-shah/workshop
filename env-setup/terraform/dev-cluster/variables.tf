variable "project_id" {
}

variable "region" {
  default = "australia-southeast1"
}

variable "zones" {
  default = ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c"]
}

variable "cluster_name" {
}

variable "network" {
}

variable "subnetwork" {
}

variable "ip_range_pods" {
}

variable "ip_range_services" {
}

variable "terraform_service_account" {
}