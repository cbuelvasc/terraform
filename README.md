# Terraform Practice
### Variable Precedence in Terraform

When using variables in Terraform, it's important to understand the order of precedence. The following table outlines the order in which Terraform assigns values to variables:

| Precedence Order | Source                                      | Description                                                                 |
|------------------|---------------------------------------------|-----------------------------------------------------------------------------|
| 1                | Environment variables                       | Variables set in the shell environment using the `TF_VAR_` prefix.          |
| 2                | `terraform.tfvars` file                     | Variables defined in a file named `terraform.tfvars` in the current directory. |
| 3                | Any `*.auto.tfvars` files                   | Variables defined in any files with the `.auto.tfvars` extension in the current directory. |
| 4                | Command-line flags                          | Variables passed directly using the `-var` or `-var-file` options.          |

### Common Terraform Commands

Here are some of the most commonly used Terraform commands along with their descriptions:

| Command                               | Description                                                                 |
|---------------------------------------|-----------------------------------------------------------------------------|
| `terraform init`       | Initializes a new or existing Terraform configuration.                      |
| `terraform plan`       | Creates an execution plan, showing what actions Terraform will take.        |
| `terraform apply`      | Applies the changes required to reach the desired state of the configuration. |
| `terraform apply --auto-approve=true` | Applies the changes required to reach the desired state of the configuration without prompting for confirmation. |
| `terraform apply --target <name of resource / module>` | Applies changes only to the specified resource or module.                  |
| `terraform apply --replace=<name of resource> --auto-approve=true` | Replaces the specified resource and applies the changes without prompting for confirmation. |
| `terraform destroy`    | Destroys the Terraform-managed infrastructure.                              |
| `terraform validate`   | Validates the Terraform configuration files.                                |
| `terraform fmt`        | Formats the Terraform configuration files to a canonical format.            |
| `terraform show`       | Provides human-readable output from a state or plan file.                   |
| `terraform output`     | Extracts the value of an output variable from the state file.               |
| `terraform output <name of specific output>` | Extracts the value of a specific output variable from the state file. |
| `terraform state`      | Advanced state management commands.                                         |
| `terraform state mv <name of specific resource SOURCE> <name of specific resource DESTINATION>`      | Moves an item in the state file to a new address. |
| `terraform state show <name of specific resource>`      | Advanced state management commands for a specific resource. |
| `terraform state rm <name of specific resource>`      | Removes a specific resource from the state file. |
| `terraform state list` | Lists all resources in the Terraform state file.                              |
| `terraform import`     | Imports existing infrastructure into your Terraform state.                  |
| `terraform graph`      | Generates a visual representation of the configuration.                     |
| `terraform graph \| dot -Tsvg > graph.svg`      | Generates a visual representation of the configuration in svf file.                     |
| `terraform workspace`  | Manages workspaces.                                                         |
| `terraform providers`  | Displays information about the providers required for the configuration.    |
| `terraform refresh`    | Updates the state file with the real infrastructure.                        |
| `terraform taint <name of resource>` | Marks a specific resource for recreation during the next `terraform apply`. |
| `terraform untaint <name of resource>` | Removes the taint from a specific resource, preventing it from being recreated during the next `terraform apply`. |


### Using Variables in Terraform Commands

Here are some examples of how to use variables with common Terraform commands:

- **Initialize with a variable file**:
    ```sh
    $ terraform init -var-file="variables.tfvars"
    ```

- **Plan with a variable**:
    ```sh
    $ terraform plan -var="instance_type=t2.micro"
    ```

- **Apply with a variable file**:
    ```sh
    $ terraform apply -var-file="variables.tfvars"
    ```

- **Destroy with a variable**:
    ```sh
    $ terraform destroy -var="instance_type=t2.micro"
    ```

    ### Variable Types in Terraform

    Terraform supports various data types for variables. Here's a breakdown of the available types:

    | Type      | Description                                                   | Example                                     |
    |-----------|---------------------------------------------------------------|---------------------------------------------|
    | `string`  | Sequence of characters                                        | `"hello"`                                   |
    | `number`  | Numeric values (integers and floats)                          | `42`, `3.14`                                |
    | `bool`    | Boolean values                                                | `true`, `false`                             |
    | `list`    | Ordered sequence of values of the same type                   | `["item1", "item2"]`                        |
    | `map`     | Collection of key-value pairs where keys are strings          | `{key1 = "value1", key2 = "value2"}`        |
    | `set`     | Unordered collection of unique values                         | `["item1", "item2"]` (with uniqueness)      |
    | `object`  | Collection of named attributes with specific types            | `{name = "John", age = 30}`                 |
    | `tuple`   | Sequence of elements with potentially different types         | `["string", 42, true]`                      |
    | `any`     | Allows any type (useful when type is unknown)                 | Any valid Terraform value                   |

    ### Variable Visibility and Scope

    The visibility of Terraform variables is determined by:

    | Scope       | Description                                            | Visibility Condition                           |
    |-------------|--------------------------------------------------------|-----------------------------------------------|
    | Root module | Variables defined in the main configuration directory  | Visible throughout the entire configuration    |
    | Child module | Variables defined within modules                       | Only visible within the module they're defined |
    | Local       | Local values defined with the `locals` block           | Only visible within the file they're defined   |
    | Environment | Variables set using `TF_VAR_` prefix                   | Visible throughout the Terraform process       |
    | Sensitive   | Variables marked as `sensitive = true`                 | Values are hidden in plan and apply outputs    |

    To mark a variable as sensitive (to hide its value in logs and output):

    ```hcl
    variable "password" {
        type        = string
        sensitive   = true
        description = "Database password"
    }
    ```

    ### Connecting to AWS Instance

    To connect to an instance, you can use the following command:

    ```sh
    $ ssh -i private-key.pem user@instance-ip
    ```

    Replace `private-key.pem` with the path to your SSH private key file, `user` with the username for the instance, and `instance-ip` with the public IP address of the instance.