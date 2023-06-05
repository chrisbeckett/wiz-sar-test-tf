resource "google_compute_firewall" "wiz-sar-test-allow-postgresql" {
  name    = "wiz-sar-test-allow-postgresql"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2600
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }
}
