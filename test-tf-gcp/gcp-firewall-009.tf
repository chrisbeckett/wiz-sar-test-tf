resource "google_compute_firewall" "wiz-sar-test-allow-mssql" {
  name    = "wiz-sar-test-allow-mssql"
  network = google_compute_network.wiz-sar-test-vpc.name
  priority = 1800
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["1433"]
  }
}
