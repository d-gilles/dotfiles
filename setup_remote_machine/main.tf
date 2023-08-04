provider "google" {
  credentials = file("~/.google/credentials/lenico-intern.json")
  project                     = var.project_id
  region                      = var.region
  zone                        = var.zone
}

resource "google_compute_instance" "default" {
  name         = "test-dev"
  machine_type = "e2-standard-2"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    # Access to the public internet
    network       = "default"
    access_config {}
  }
}
