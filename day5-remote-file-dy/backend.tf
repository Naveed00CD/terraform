
 terraform {
backend "s3" {
    bucket         = "serxdcfvgbhjncgfhlk"
    region         =  "ap-south-1"
    key            = "terraform.tfstate" # Path within the bucket where the state will be read/written.
    dynamodb_table = "navvedddk1k1k1" # DynamoDB table used for state locking, note: first run Day4-s3bucket-DynamoDB-create-for-backend-statefile-remote-locking
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
}
}