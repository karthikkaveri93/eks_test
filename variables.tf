variable "region" {
    description = "region"
    type = string
}

variable "private_subnets" {
    description = "private subnet value"
    type = list(string)
}

variable "public_subnets" {
    description = "public subnet value"
    type = list(string)
}