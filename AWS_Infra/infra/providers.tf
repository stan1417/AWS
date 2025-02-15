terraform {
  required_version = "1.5.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "terraform_statefile_bucket"  
    key            = "tfstae/terraform.tfstate"  
    region         = "ap-south-1"  
    encrypt        = true  
    dynamodb_table  = "tf-lock-table" 
  }
}
