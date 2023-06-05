resource "google_compute_firewall" "wiz-sar-test-allow-range" {
  name    = "wiz-sar-test-allow-range"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2400
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["5000-5100"]
  }
}
