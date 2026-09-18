variable "instance_name" {
  type    = string
  default = "devops-app-server"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "project_id" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}
