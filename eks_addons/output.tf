output "alb_controller_helm_release_name" {
  value = helm_release.aws_load_balancer_controller.name
}

output "alb_controller_namespace" {
  value = helm_release.aws_load_balancer_controller.namespace
}