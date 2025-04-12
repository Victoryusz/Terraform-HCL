# Mostra o IP da VM para o acesso SSH posterior. #
output "vm_ip" {
  description = "IP da VM criada na AWS com Terraform"
  value       = aws_instance.vm.public_ip
}
