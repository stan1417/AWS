terraform {
  backend "s3" {
    bucket         = "terraform_statefile_bucket"  
    key            = "tfstae/terraform.tfstate"  
    region         = "ap-south-1"  
    encrypt        = true  
    dynamodb_table  = "tf-lock-table" 
  }
}
