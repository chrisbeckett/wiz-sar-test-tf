resource "google_compute_firewall" "wiz-sar-test-allow-vnc" {
  name    = "wiz-sar-test-allow-vnc"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 3100
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["5500","5800","5900"]
  }
}
