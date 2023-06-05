resource "google_compute_network" "wiz-sar-test-vpc" {
  name = "wiz-sar-test-vpc"
  auto_create_subnetworks = true
}

resource "google_compute_firewall" "wiz-sar-test-allow-rdp" {
  name    = "wiz-sar-test-allow-rdp"
  network = google_compute_network.wiz-sar-test-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
}
