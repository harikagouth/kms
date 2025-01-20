resource "aws_kms_key" "this" {
  description             = var.description
  enable_key_rotation     = var.enable_key_rotation
  key_usage               = var.key_usage
  rotation_period_in_days = var.rotation_period_in_days
  tags                    = var.tags
}

resource "aws_kms_key_policy" "this" {
  key_id = aws_kms_key.this.id
  policy = templatefile(var.policy.path, var.policy.params)
}


resource "aws_kms_alias" "this" {
  target_key_id = aws_kms_key.this.id
  name          = local.domain == "shr" ? local.shr_name : local.name
}