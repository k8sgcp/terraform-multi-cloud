
resource "google_compute_instance" "app_server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["http-server", "https-server", "app-port"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 30 # GB
    }
  }

  network_interface {
    network = var.network_name
    access_config {
      // Gives the VM an ephemeral public IP
    }
  }

  # Startup script to auto-install Docker & Docker Compose
  metadata_startup_script = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y ca-certificates curl gnupg lsb-release
    
    # Install Docker
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
    # Enable and start Docker service
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker ubuntu
  EOF
}
