resource "google_compute_firewall" "wiz-sar-test-allow-netbios" {
  name    = "wiz-sar-test-allow-netbios"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1900
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["137", "139"]
  }

    allow {
    protocol = "udp"
    ports    = ["137", "139"]
  }

}
