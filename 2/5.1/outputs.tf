output "instance_ip" {
  value       = aws_instance.vm-terraform.public_ip
  description = "Endereço IP público da instância EC2"
}
