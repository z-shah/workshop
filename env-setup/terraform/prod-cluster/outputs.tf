output "cluster_name" {
  value = module.gke.name
}

output "cluster_id" {
  value = module.gke.cluster_id
}

output "master_version" {
  value = module.gke.master_version
}