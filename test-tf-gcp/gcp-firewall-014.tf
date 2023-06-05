resource "google_compute_firewall" "wiz-sar-test-allow-all-local" {
  name    = "wiz-sar-test-allow-all-local"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2300
  source_ranges = ["10.0.0.0/8"]

  allow {
    protocol = "all"
  }
}
