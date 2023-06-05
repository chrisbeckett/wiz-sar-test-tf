resource "google_compute_firewall" "wiz-sar-test-allow-ssh" {
  name    = "wiz-sar-test-allow-ssh"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1100
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
