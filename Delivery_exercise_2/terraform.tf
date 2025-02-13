terraform {
  # provider declaration
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

# provider configs
provider "proxmox" {
  pm_api_url      = var.pm_host
  pm_tls_insecure = var.pm_tls_insecure
  pm_log_enable   = true
  pm_log_file     = "terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
