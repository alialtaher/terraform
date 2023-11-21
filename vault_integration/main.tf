provider "vault" {
    address = "http://127.0.0.1:8200"
}
data "vault_generic_secret" "password" {
  path = "secret/db_creds"
}

output "secret" {
    value = data.vault_generic_secret.password.data_json
    sensitive = true
}

