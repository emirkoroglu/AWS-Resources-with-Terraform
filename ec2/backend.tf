terraform {
  backend "s3" {
    bucket = "my-tf-backend-bucket-emir1"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}