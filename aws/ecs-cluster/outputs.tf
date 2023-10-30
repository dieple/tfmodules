output "cluster_name" {
  description = "The name of the cluster"
  value       = aws_ecs_cluster.cluster.name
}

output "cluster_id" {
  description = "The Amazon ID that identifies the cluster"
  value       = aws_ecs_cluster.cluster.id
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
  value       = aws_ecs_cluster.cluster.arn
}

output "sd_id" {
  value = aws_service_discovery_private_dns_namespace.default.id
}

output "sd_arn" {
  value = aws_service_discovery_private_dns_namespace.default.arn
}

output "sd_name" {
  value = aws_service_discovery_private_dns_namespace.default.name
}

output "sd_hosted_zone" {
  value = aws_service_discovery_private_dns_namespace.default.hosted_zone
}