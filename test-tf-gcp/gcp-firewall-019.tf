resource "google_compute_firewall" "wiz-sar-test-allow-tfp" {
  name    = "wiz-sar-test-allow-ftp"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2800
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["20", "21"]
  }
}
