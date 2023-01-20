variable "bare_domain_name" {
  description = "The DNS name of the site (w/o www)"
  type        = string
}

variable "index_document" {
  description = "The file to serve for the index"
  type        = string
  default     = "index.html"
}
