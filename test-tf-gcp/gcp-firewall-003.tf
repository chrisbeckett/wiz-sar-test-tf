resource "google_compute_firewall" "wiz-sar-test-allow-smtp" {
  name    = "wiz-sar-test-allow-smtp"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1200
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["25"]
  }
}
