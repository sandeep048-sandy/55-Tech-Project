output "bucket_name" {
  description = "The name of the S3 bucket used for remote state."
  value       = aws_s3_bucket.state.bucket
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform locking."
  value       = aws_dynamodb_table.locks.name
}
