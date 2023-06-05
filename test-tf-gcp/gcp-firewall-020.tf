resource "google_compute_firewall" "wiz-sar-test-allow-mongodb" {
  name    = "wiz-sar-test-allow-mongodb"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2900
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["27017-27020"]
  }
}
