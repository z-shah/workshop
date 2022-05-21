module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 4.0"
  project_id   = var.project_id
  network_name = "vpc-gke-cluster"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-01-gke"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = var.region
    },
    {
      subnet_name   = "subnet-02-gke"
      subnet_ip     = "10.10.30.0/24"
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    subnet-01-gke = [
      {
        range_name    = "subnet-01-gke-pods"
        ip_cidr_range = "192.168.0.0/20"
      },
      {
        range_name    = "subnet-01-gke-services"
        ip_cidr_range = "10.4.1.0/25"
      }
    ],
    subnet-02-gke = [
      {
        range_name    = "subnet-02-gke-pods"
        ip_cidr_range = "192.168.16.0/20"
      },
      {
        range_name    = "subnet-02-gke-services"
        ip_cidr_range = "10.4.1.128/25"
      }
    ],

  }

  routes = [
    {
      name              = "vpc-egress-internet-access"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}