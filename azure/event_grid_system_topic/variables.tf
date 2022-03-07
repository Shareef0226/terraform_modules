variable "name"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

variable "topic_type" {
    type = string
}

variable "source_arm_resource_id" {
    type = string
}

variable "tags" {
    type = map(string)
}