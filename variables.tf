variable "client_id" {
    default = "c0d5db82-75ed-4c6a-8a4f-27a3763fa932"
}

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "k8stest"
}

variable cluster_name {
    default = "k8stest"
}

variable resource_group_name {
    default = "azure-k8s"
}

variable location {
    default = "Central US"
}
