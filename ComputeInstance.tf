# Infrastructure as Code with Terraform
# creating computer instance
# terraform --version
# mkdir <dir>
# touch <file.tf>
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
provider "google" {
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_instance" "terraform" {
  name         = "terraform"
  machine_type = "n1-standard-2"
  tags         = ["web", "dev"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  allow_stopping_for_update = true #for updating vm config
}
# terraform init
# terraform plan
# terraform apply
# terraform destroy