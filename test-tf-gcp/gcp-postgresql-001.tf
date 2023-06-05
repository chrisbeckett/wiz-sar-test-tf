resource "random_string" "random-gcp-postgres-name" {
  length = 6
  special = false
  lower = true
}

resource "google_sql_database" "wiz-sar-test-pg-db" {
  name     = "wiz-sar-test-pg-${lower(random_string.random-gcp-postgres-name.result)}"
  instance = google_sql_database_instance.wiz-sar-test-dbinstance.name
}

# Creates a DB instance and adds a sample database flag to prevent playbook errors.
# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "wiz-sar-test-dbinstance" {
  name             = "wiz-sar-test-instance-${lower(random_string.random-gcp-postgres-name.result)}"
  region           = var.gcp-region
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"
    database_flags {
      name  = "log_connections"
      value = "off"
    }
    database_flags {
      name  = "log_disconnections"
      value = "off"
    }
    database_flags {
      name  = "log_lock_waits"
      value = "off"
    }
    database_flags {
      name  = "log_min_duration_statement"
      value = "250"
    }
    database_flags {
      name  = "log_temp_files"
      value = "1000"
    }
    database_flags {
      name  = "log_checkpoints"
      value = "off"
    }
    database_flags {
      name  = "log_min_error_statement"
      value = "info"
    }
  }

  deletion_protection  = "false"
}