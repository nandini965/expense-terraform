terraform {
  backend "s3" {
    bucket     = "nandini24"
    key        = "expense/dev/terraform.tfstate"
    region     = "us-east-1"
  }
}
