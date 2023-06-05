resource "google_compute_firewall" "wiz-sar-test-allow-cifs" {
  name    = "wiz-sar-test-allow-cifs"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 3000
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["139", "445"]
  }

  allow {
    protocol = "udp"
    ports    = ["137","138","445"]
  }
}
