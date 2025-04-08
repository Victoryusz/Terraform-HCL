# ------------------------------
# Recurso: azurerm_resource_group.gpo_de_recurso
# Descrição: Cria um Grupo de Recursos (Resource Group) no Azure
# Utilizado para agrupar logicamente os recursos do Terraform
# ------------------------------

resource "azurerm_resource_group" "gpo_de_recurso" {
  name     = "grp_rec_terraform-state" # Nome do Resource Group no Azure
  location = var.location              # Região onde o Resource Group será criado (vindo de uma variável)
  tags     = local.common_tags         # Tags comuns aplicadas a esse recurso (definidas em locals)
}

# ----------------------------------------------------------
# Recurso: azurerm_storage_account.armz_acc
# Descrição: Cria uma Storage Account para armazenar blobs (ex: terraform state)
# A conta está vinculada ao Resource Group definido acima
# ----------------------------------------------------------

resource "azurerm_storage_account" "armz_acc" {
  name                     = "victorstate"                                  # Nome da Storage Account
  resource_group_name      = azurerm_resource_group.gpo_de_recurso.name     # Associa a conta ao Resource Group previamente criado
  location                 = azurerm_resource_group.gpo_de_recurso.location # Define a localização da storage account (mesma do RG)
  account_tier             = var.account_tier                               # Tier de performance da conta (ex: Standard ou Premium)
  account_replication_type = var.account_replication_type                   # Tipo de replicação dos dados (ex: LRS, GRS, ZRS)

  blob_properties {
    versioning_enabled = true # Ativa versionamento de blobs, útil para histórico de estados do Terraform 
  }

  tags = local.common_tags # Aplica as tags definidas em local.common_tags para organização
}

# ------------------------------------------------------------
# Recurso: azurerm_storage_container.container
# Descrição: Cria um container na Storage Account para armazenar
# o arquivo de estado remoto do Terraform (terraform.tfstate)
# ------------------------------------------------------------

resource "azurerm_storage_container" "container" {
  name                  = "container-remote-state"              # Nome do container dentro da Storage Account
  storage_account_name  = azurerm_storage_account.armz_acc.name # Nome da Storage Account onde o container será criado
  container_access_type = "private"                             # Define o nível de acesso ao container (público, privado, etc)

}