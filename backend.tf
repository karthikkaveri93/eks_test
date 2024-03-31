terraform {
  backend "s3" {
    bucket = "karthikbucket-new-123456789"
    key = "terraform7/terraform.tfstate"
    region = "ap-south-1"
  }
}