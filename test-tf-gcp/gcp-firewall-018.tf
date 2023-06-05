resource "google_compute_firewall" "wiz-sar-test-allow-uncommon-ports" {
  name    = "wiz-sar-test-allow-uncommon-ports"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2700
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["1433", "1521"]
  }
}
