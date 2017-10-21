variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable source_ranges {
  description = "Allowed IP addresses"
  default = ["0.0.0.0/0"]
}
