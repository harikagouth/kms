variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "context" {
  description = "(Optional) The context that the resource is deployed in. e.g. devops, logs, lake"
  type        = string
  default     = "01"
}

variable "description" {
  description = "(Optional) The description of the key as viewed in AWS console."
  type        = string
  default     = "Key used to encrypt decrypt"
}

variable "key_usage" {
  description = "(Optional) Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC. Defaults to ENCRYPT_DECRYPT"
  type        = string
  default     = "ENCRYPT_DECRYPT"
  validation {
    error_message = "Valid values for var: key_usage are ENCRYPT_DECRYPT, SIGN_VERIFY, or GENERATE_VERIFY_MAC"
    condition     = contains(["ENCRYPT_DECRYPT", "SIGN_VERIFY", "GENERATE_VERIFY_MAC"], var.key_usage)
  }
}

variable "policy" {
  description = "(Required) Path & params for a valid policy json file."
  type = object({
    path   = string
    params = map(string)
  })
}

variable "enable_key_rotation" {
  description = "(Optional) Specifies whether key rotation is enabled. Defaults to true"
  type        = bool
  default     = true
}

variable "rotation_period_in_days" {
  description = "(Optional) Custom period of time between each rotation date. Must be a number between 90 and 2560 (inclusive)."
  type        = number
  default     = 180
}
