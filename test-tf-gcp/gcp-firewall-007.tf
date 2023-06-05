resource "google_compute_firewall" "wiz-sar-test-allow-https" {
  name    = "wiz-sar-test-allow-https"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1600
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}
