output "username" {
  value = var.admin_username
  //module.vm_app.admin_username
}

output "password" {
  value = var.admin_password
  //module.vm_app.admin_password
}

output "psql_username" {
  value = var.admin_db_username //azurerm_postgresql_flexible_server.psql_server.administrator_login 
}

output "psql_password" {
  value = var.admin_db_password //azurerm_postgresql_flexible_server.psql_server.administrator_password 
}
