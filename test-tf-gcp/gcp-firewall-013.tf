resource "google_compute_firewall" "wiz-sar-test-allow-all" {
  name    = "wiz-sar-test-allow-all"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2200
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "all"
  }
}
