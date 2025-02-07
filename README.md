# Automate AWS with Terraform Example

## Creating `terraform.tfvars`

To manage variables in your `main.tf` in the root project, create a `terraform.tfvars` file with the following content:

```hcl
# Example variables
variable_name = "value"
another_variable = "another_value"
```

Make sure to replace the example variables with the actual variables defined in your `main.tf`.

## Running the Project

To run this Terraform project, follow these steps:

1. **Initialize the Terraform configuration:**

    ```sh
    terraform init
    ```

2. **Preview the changes to be applied:**

    ```sh
    terraform plan
    ```

3. **Apply the changes:**

    ```sh
    terraform apply
    ```

4. **Destroy the infrastructure (if needed):**

```sh
terraform destroy
```
