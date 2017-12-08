# terraform-aws-key-pair

Terraform module for generating (or importing) a SSH public key file into AWS.

## Usage

```hcl
module "default" {
  source                = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=master"
  namespace             = "cp"
  stage                 = "prod"
  name                  = "app"
  ssh_public_key_path   = "/secrets"
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
}
```

## Variables

|  Name                        |  Default       |  Description                                            | Required |
|:-----------------------------|:--------------:|:--------------------------------------------------------|:--------:|
| `namespace`                  | ``             | Namespace (e.g. `cp` or `cloudposse`)                   | Yes      |
| `stage`                      | ``             | Stage (e.g. `prod`, `dev`, `staging`)                   | Yes      |
| `name`                       | ``             | Application Name  (e.g. `bastion` or `app`)             | Yes      |
| `ssh_public_key_path`        | ``             | Path to Read/Write SSH Public Key File (directory)      | Yes      |
| `generate_ssh_key`           | `false`        | If set to `true`, new ssh key pair will be created      | No       |
| `private_key_extension`      | ``             | Private key file extension, _e.g._ `.pem`               | No       |
| `public_key_extension`       | `.pub`         | Public key file extension, _e.g._ `.pub`                | Yes      |


## Outputs

| Name                  | Description                                   |
|:----------------------|:----------------------------------------------|
| `key_name`            | Name of SSH key                               |
| `public_key`          | Contents of the generated public key          |
