terraform {
  required_version = ">=1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.23.1"
    }
  }
}

module "key" {
  source                  = "github.com/rio-tinto/rtlh-tf-aws-kms-key?ref=v1.0.0"
  description             = "Key used to encrypt"
  enable_key_rotation     = true
  key_usage               = "ENCRYPT_DECRYPT"
  rotation_period_in_days = 90
  policy                  = file("./policy.json")
}
