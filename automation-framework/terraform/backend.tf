terraform {
  backend "s3" {
    # Replace these values with your own S3 bucket + key.
    bucket         = "your-terraform-state-bucket"
    key            = "automation-framework/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}
