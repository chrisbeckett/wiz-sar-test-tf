resource "google_compute_firewall" "wiz-sar-test-allow-rpc" {
  name    = "wiz-sar-test-allow-rpc"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2100
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["135"]
  }
}
