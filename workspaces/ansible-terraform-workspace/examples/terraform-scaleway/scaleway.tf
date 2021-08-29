terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone = "fr-par-1"
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_server" "web" {
  type              = "DEV1-S"
  image             = "ubuntu_focal"
  ip_id             = scaleway_instance_ip.public_ip.id
  security_group_id = scaleway_instance_security_group.web.id
  
  root_volume {
    delete_on_termination = false
  }
  additional_volume_ids = [ scaleway_instance_volume.data.id ]
}

resource "scaleway_instance_security_group" "web" {
  name        = "http"
  description = "allow HTTP and HTTPS traffic"

  inbound_rule {
    action = "accept"
    port = 80
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
  }

  inbound_rule {
    action = "accept"
    port = 443
    ip_range = "0.0.0.0/0"
    protocol = "TCP"
  }
}

resource "scaleway_instance_volume" "data" {
  size_in_gb = 100
  type = "b_ssd"
}