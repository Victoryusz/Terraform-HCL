##########################################

output "subnet_id" {
  description = "ID da subnet criada na azure"
  value       = azurerm_subnet.subnet.id
}

##########################################

output "security_group_id" {
  description = "ID da Network Security Group Criada na Azure"
  value       = azurerm_network_security_group.nsg.id
}
