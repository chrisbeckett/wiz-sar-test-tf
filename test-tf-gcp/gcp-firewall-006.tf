resource "google_compute_firewall" "wiz-sar-test-allow-telnet" {
  name    = "wiz-sar-test-allow-telnet"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1500
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["23"]
  }
}
