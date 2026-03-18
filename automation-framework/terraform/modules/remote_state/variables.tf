variable "bucket_name" {
  description = "The name of the S3 bucket to use for Terraform remote state."
  type        = string
}

variable "region" {
  description = "AWS region in which to create the S3 bucket and DynamoDB table."
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform locking."
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}
