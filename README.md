---

@logmedaily/terraform-aws-tags

# Terraform Tags Module

Required Terraform Version 1.5.7

## Overview

This is a utility module designed to consolidate different types of tags into a single map that can be applied to AWS resources or any other Terraform-managed resources that support tagging.

## Variables

### `global_tags`

- **Description**: Global tags that should be applied to all resources.
- **Type**: map(string)
- **Default**: {}

## Output

### `tags`

- **Description**: This output contains the merged map of all the input tags, which can be used in other modules or resources.
- **Type**: map(string)

## Usage Example

```hcl
module "tags" {
  source = "./tags_module"

  global_tags = {
    "Environment" = "Production"
    "ManagedBy"   = "Terraform"
    "Role" = "Nginx"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(
    {
      "Name" = "MyVPC"
    },
    module.tags.all_tags
  )
}
```
