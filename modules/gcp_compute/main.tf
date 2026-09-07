resource "google_compute_instance" "vm_instance" {
name          = var.instance_name
machine_type  = var.machine_type
zone          = var.zone
project       = var.project_id

boot_disk {
  initialize_params {
      image = "debian-cloud/debian-12"
    }
  }


network_interface {
    subnetwork = var.subnet_id

    # Ephemeral public IP address
    access_config {}
  }
}
