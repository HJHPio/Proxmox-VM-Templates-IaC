#!/bin/bash
set -e

echo "Starting Proxmox VM Templates deployment process..."

if [[ "$GENERATE_KEYS" == "true" ]]; then
  echo "Generating SSH keys..."
  mkdir -p /runtime/infrastructure/keys
  ssh-keygen -t rsa -b 4096 -f /runtime/infrastructure/keys/id_rsa -N ''
  cat /runtime/infrastructure/keys/id_rsa.pub > /runtime/infrastructure/keys/ssh-pub-keys.key
  echo "SSH keys successfully generated."
else
  echo "SSH key generation skipped (GENERATE_KEYS=$GENERATE_KEYS)"
fi

echo "Initiating tofu deployment..."
cd /runtime/infrastructure/terraform

echo "Running tofu init..."
tofu init

echo "Running tofu plan..."
tofu plan -out=init.tfplan

echo "Applying planned infrastructure..."
tofu apply "init.tfplan"

echo "Confizard deployment completed successfully."
