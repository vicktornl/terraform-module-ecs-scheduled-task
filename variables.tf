variable "name" {
  type = string
}

variable "schedule_expression" {
  type = string
}

variable "cluster_arn" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "task_definition_arn" {
  type = string
}

variable "container_override_name" {
  type = string
}

variable "container_override_command" {
  type = list(string)
}
