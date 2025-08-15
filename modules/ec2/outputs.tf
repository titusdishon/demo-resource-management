output "instance_id" {
  value = aws_instance.web.id
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet_id" {
  value = local.selected_subnet_id
}
