variable "vpc-cidr" {
  type        = string
  description = "name of vpc cidr"
  default     = "10.0.0.0/16"
}


variable "pubsub1-cidr" {
  type        = string
  description = "name of public subnet1 cidr"
  default     = "10.0.1.0/24"
}


variable "pubsub2-cidr" {
  type        = string
  description = "name of public subnet2 cidr"
  default     = "10.0.2.0/24"
}


variable "privsub1-cidr" {
  type        = string
  description = "name of private subnet1 cidr"
  default     = "10.0.3.0/24"
}

variable "privsub2-cidr" {
  type        = string
  description = "name of private subnet2 cidr"
  default     = "10.0.4.0/24"
}


variable "az1" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2a"
}

variable "az2" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2a"
}

variable "az3" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2b"
}

variable "az4" {
  type        = string
  description = "name of availability zone"
  default     = "eu-west-2b"
}

variable "region-name" {
  type        = string
  description = "name of region"
  default     = "eu-west-2"
}
