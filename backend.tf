terraform {
  backend "s3" {
    bucket         = "prod-astrovidhi-terraform-remote-state"
    key            = "do-not-delete/prod-astrovidhi/terraform.tfstate"
    region         = "ap-south-2"
    encrypt        = true
    dynamodb_table = "Prod-astrovidhi-terraform-remote-state-lock"
  }
}
