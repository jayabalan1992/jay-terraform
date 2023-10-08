variable "account_id" {
  default = "k8s-svc"
}

variable "gkenode_machine_type" {
  default = "e2-medium"
}

variable "location" {
  default = "us-west1-b"
}

variable "nodepool_node_count" {
  default = 1
}

variable "project" {
  default = "civil-hologram-401105"
}
