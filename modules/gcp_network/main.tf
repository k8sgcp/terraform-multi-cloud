

resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = true
}

# Allow SSH and App Inbound Traffic
resource "google_compute_firewall" "allow_app_traffic" {
  name    = "allow-app-traffic"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3000"]
  }

  source_ranges = ["0.0.0.0/0"]
  }
