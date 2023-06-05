resource "google_compute_firewall" "wiz-sar-test-allow-icmp" {
  name    = "wiz-sar-test-allow-icmp"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2000
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }
}
