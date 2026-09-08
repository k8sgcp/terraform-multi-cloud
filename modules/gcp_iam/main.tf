resource "google_service_account" "sa" {
account_id     = var.service_account_id
display_name   = var.display_name
project        = var.project_id
}


resource "google_project_iam_member" "sa_binding" {
project   = var.project_id
role      = var.role
member    = "serviceAccount:${google_service_account.sa.email}"
}
