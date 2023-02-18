# Terraform Docker Provider on Remote Host

This is a sample Terraform project that demonstrates how to use the Docker provider to manage Docker containers and images on a remote host. The provider will be configured to connect to the Docker host via SSH, and registry authentication details will be passed using variables. You can use this project as a starting point to manage your Docker infrastructure using Terraform.

## Changes Made

The original configuration was split into three files: `main.tf`, `providers.tf`, and `variables.tf`. The Docker provider configuration was moved to `providers.tf`, while the variable definitions were moved to `variables.tf`. The main Docker resource block was left in `main.tf`.

Additionally, the following changes were made:

- The `docker_host`, `registry_address`, and `registry_config_file` variables were parameterized and moved to `variables.tf`.
- The values for these variables were moved to a `.tfvars` file (`terraform.tfvars` in this case) for easier management.
- The `ssh_key` argument was added to the `docker` provider block in `providers.tf` to specify the location of the SSH private key for connecting to the remote Docker host.

## Usage

To use this Terraform configuration, follow these steps:

1. Clone this repository to your local machine.
2. Update the values in `terraform.tfvars` with the appropriate values for your environment.
3. Run `terraform init` to initialize the working directory and download the necessary providers.
4. Run `terraform apply` to apply the configuration and provision the Docker resources.

Note that you must have the necessary credentials and permissions to connect to the remote Docker host and registry. Also, ensure that your SSH private key is in the correct location and that the file permissions are set appropriately.

## License

This Terraform configuration is released under the MIT License. See LICENSE for details.
