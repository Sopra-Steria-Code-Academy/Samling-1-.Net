variable "environment" {
  type        = string
  description = "Name of the application environment"
  default     = "test"
}
variable "rg_name" {
  type        = string
  description = "The resource group name"
  default     = "rc-codeacademy-example"
}

variable "rg_location" {
  type        = string
  description = "Azure region for Right Cloud resources 2"
  default     = "West Europe"
}