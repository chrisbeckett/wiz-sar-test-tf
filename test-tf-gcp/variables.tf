variable "gcp-project" {
   type = string
   description = "The ID of the GCP Project, e.g. my-project-235325"
   default = "<PROJECT-ID>"  
}

variable "gcp-region" {
   type = string
   description = "The GCP region the project is in, e.g. us-central-1"
   default = "europe-west2"
}

variable "gcp-zone" {
   type = string
   description = "The GCP zone where the services will be hosted, e.g. us-central1-c"
   default = "europe-west2a"
}
