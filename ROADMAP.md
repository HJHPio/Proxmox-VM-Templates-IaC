Potential Project Extension Ideas (not currently planned for the published example):
  - Extend the infrastructure example to support provisioning of all VM templates available on Proxmox nodes.
  - Improve SSH key generation and distribution to prevent redundant key transfers and avoid unnecessary regeneration after tofu destroy && tofu apply.
  - Refactor the cleanup script by separating logic per resource to enable more granular and modular infrastructure provisioning (refer to (repo-root)/infrastructure/terraform/main.tf).
