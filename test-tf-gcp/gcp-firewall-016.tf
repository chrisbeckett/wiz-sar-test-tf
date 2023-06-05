resource "google_compute_firewall" "wiz-sar-test-allow-mysql" {
  name    = "wiz-sar-test-allow-mysql"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 2500
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }
}
