provider "google" {
  project = "ms-solutionist"
  region  = "us-central1"
}

module "network" {
  source       = "../../modules/gcp_network"
  network_name = "dev-vpc"
  subnet_name  = "dev-subnet"
  project_id   = "ms-solutionist"
}

module "compute" {
  source        = "../../modules/gcp_compute"
  instance_name = "dev-app-server"
  project_id    = "ms-solutionist"
  network_name  = module.network.network_name
  subnet_id     = module.network.subnet_id
}

output "server_ip" {
  value = module.compute.public_ip
}
