resource "azurerm_virtual_machine_extension" "ext_mma_dc" {
  count = var.vm_dc_count
  name = var.ext_mma_name
  virtual_machine_id = azurerm_windows_virtual_machine.vm_dc[count.index].id
  publisher = var.ext_mma_pub
  type = var.ext_mma_type
  type_handler_version = var.ext_mma_ver
  settings = <<SETTINGS
    {
      "workspaceId" : "${azurerm_log_analytics_workspace.oms_updates.workspace_id}"
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "workspaceKey" : "${azurerm_log_analytics_workspace.oms_updates.primary_shared_key}"
    }
  PROTECTED_SETTINGS  
}
resource "azurerm_virtual_machine_extension" "ext_da_dc" {
  count = var.vm_dc_count
  name = var.ext_da_name
  virtual_machine_id = azurerm_windows_virtual_machine.vm_dc[count.index].id
  publisher = var.ext_da_pub
  type = var.ext_da_type
  type_handler_version = var.ext_da_ver
  settings = <<SETTINGS
    {
      "workspaceId" : "${azurerm_log_analytics_workspace.oms_updates.workspace_id}"
    }
  SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      "workspaceKey" : "${azurerm_log_analytics_workspace.oms_updates.primary_shared_key}"
    } 
  PROTECTED_SETTINGS  
}
