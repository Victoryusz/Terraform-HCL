############### VARIAVEIS ###############

variable "location" {
  description = "Região onde os recursos serão criados na Azure"
  type        = string
  default     = "West Europe"

}
variable "account_tier" {
  description = "Tier da Storage Account na Azure"
  type        = string
  default     = "Standard"

}
variable "account_replication_type" {
  description = "Tipo de Replicação de dados da Storage Account"
  type        = string
  default     = "LRS"

}

########################################
