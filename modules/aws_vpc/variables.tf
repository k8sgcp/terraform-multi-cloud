variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}
