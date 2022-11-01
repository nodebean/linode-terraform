output "kubeconfig" {
  value     = linode_lke_cluster.beanteam_cluster.kubeconfig
  sensitive = true
}

output "api_endpoints" {
  value = linode_lke_cluster.beanteam_cluster.api_endpoints
}

output "status" {
  value = linode_lke_cluster.beanteam_cluster.status
}

output "id" {
  value = linode_lke_cluster.beanteam_cluster.id
}

output "pool" {
  value = linode_lke_cluster.beanteam_cluster.pool
}