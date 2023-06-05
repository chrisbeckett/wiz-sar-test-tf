resource "google_compute_firewall" "wiz-sar-test-allow-http" {
  name    = "wiz-sar-test-allow-http"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1300
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
