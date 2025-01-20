locals {
  workspace = split("-", terraform.workspace)
  name      = format("alias/kms-%s-%s-aws-%s-%s-%s", local.workspace[1], local.workspace[2], local.workspace[4], local.workspace[5], var.context)
  shr_name  = format("alias/kms-%s-%s-aws-%s-%s", local.workspace[1], local.workspace[2], local.workspace[4], var.context)
  domain    = local.workspace[2]
}