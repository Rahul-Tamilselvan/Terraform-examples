#!/bin/bash

# Fail on error
set -e

# Usage: ./init-terraform.sh dev|stage|prod
ENVIRONMENT=$1

if [[ -z "$ENVIRONMENT" ]]; then
  echo "Usage: $0 <dev|stage|prod>"
  exit 1
fi

# Customize backend config per environment
RESOURCE_GROUP_NAME="tfstate-rg"
STORAGE_ACCOUNT_NAME="tfstateaksstorage"
CONTAINER_NAME="tfstate"
KEY="terraform-${ENVIRONMENT}.tfstate"
LOCATION="eastus"

# Go to environment directory
cd envs/$ENVIRONMENT

# Initialize Terraform with backend config
terraform init \
  -backend-config="resource_group_name=${RESOURCE_GROUP_NAME}" \
  -backend-config="storage_account_name=${STORAGE_ACCOUNT_NAME}" \
  -backend-config="container_name=${CONTAINER_NAME}" \
  -backend-config="key=${KEY}" \
  -backend-config="location=${LOCATION}"

echo "✅ Terraform initialized for '${ENVIRONMENT}' environment."
