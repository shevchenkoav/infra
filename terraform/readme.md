# Terraform

base commands: init, get, import, plan, apply

without provisioning: without [connection],[provisioner]

# import existing in gcp ssh rule for firewall from modules configuration.
terraform import module.vpc.google_compute_firewall.firewall_ssh default-allow-ssh
