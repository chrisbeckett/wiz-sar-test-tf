resource "google_compute_firewall" "wiz-sar-test-allow-dns" {
  name    = "wiz-sar-test-allow-dns"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1400
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["53"]
  }

  allow {
    protocol = "udp"
    ports    = ["53"]
  }
}
