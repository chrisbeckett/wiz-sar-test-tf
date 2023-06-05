resource "google_compute_firewall" "wiz-sar-test-allow-oracle" {
  name    = "wiz-sar-test-allow-oracle"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1700
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["1521", "1830", "2483", "2484"]
  }
}
