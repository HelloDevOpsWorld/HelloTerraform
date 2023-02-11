# HelloTerraform

Welcome to the HelloTerraform repository! This repository contains simple Terraform code that demonstrates how to create Docker containers using Terraform.

## Requirements

Before you start, you need to have the following:

- Terraform (version 0.12 or later)
- Docker (version 18.06.0 or later)

## How to use

Clone this repository to your local machine:
```bash
git clone https://github.com/HelloDevOpsWorld/HelloTerraform.git
```
Change into the `docker-tf` or `docker-custom-registry-tf` directory:
```bash
cd HelloTerraform/docker-tf
```
or
```bash
cd HelloTerraform/docker-custom-registry-tf
```
Initialize Terraform by running the following command:
```bash
terraform init
```
Preview the changes that Terraform will make by running the following command:
```bash
terraform plan -out=plan.out
```
Apply the changes by running the following command:
```bash
terraform apply plan.out
```

This will create a Docker container based on the Nginx image and expose it on port 8080.

To remove the Docker container, simply run the following command:
```bash
terraform destroy
```
## Explanation of the code

The Terraform code in this repository does the following:

* Sets up the required provider and version: The Docker provider is set up with version 3.0.1.
* Configures the Docker provider: The Docker provider is configured with no additional parameters in `docker-tf` and with docker config file in `docker-custom-registry-tf` .
* Creates a Docker image resource: A Docker image resource is created based on the Nginx image (version latest).
* Creates a Docker container resource: A Docker container resource is created based on the Nginx image, named "nginx," and exposed on port 8080.

## Conclusion

That's it! You've successfully created a Docker container using Terraform. This code serves as a simple example of how Terraform can be used to manage Docker containers. Feel free to customize this code to meet your needs.

## License
This project is licensed under the MIT License.