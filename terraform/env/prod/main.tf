terraform {
  backend "s3" {
    bucket = "yopa.terraform.how.wtf"
    key = "env/prod/terraform.tfstate"
    region = "us-east-1"
  }
}

provider aws {
  region = "us-east-1"
}

module "website" {
  source = "../../modules/website"
  bucket_name = "how.wtf"
  domain_names = ["how.wtf", "www.how.wtf"]
}

output "cloudfront_distribution_id" {
  value = module.website.cloudfront_distribution_id
}
