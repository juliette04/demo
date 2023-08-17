
variable "isPROD" {
  type = bool
  default = true
}


variable "Environment" {
  type    = list
  default = ["prod", "dev"]

}