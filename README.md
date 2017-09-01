# tf_key_pair

Terraform module for importing SSH public key file into AWS.

## Usage

```terraform
module "default" {
  source              = "git::https://github.com/cloudposse/tf_key_pair.git?ref=tags/0.1.0"
  namespace           = "${var.namespace}"
  stage               = "${var.stage}"
  name                = "${var.name}"
  ssh_public_key_path = "${var.ssh_public_key_path}"
  generate_ssh_key    = "${var.generate_ssh_key}"
}
```

## Variables

|  Name                        |  Default       |  Description                                            | Required |
|:-----------------------------|:--------------:|:--------------------------------------------------------|:--------:|
| `namespace`                  | ``             | Namespace (e.g. `cp` or `cloudposse`)                   | Yes      |
| `stage`                      | ``             | Stage (e.g. `prod`, `dev`, `staging`)                   | Yes      |
| `name`                       | ``             | Name  (e.g. `bastion` or `db`)                          | Yes      |
| `ssh_public_key_path`        | ``             | Path to Read/Write SSH Public Key File (directory)      | Yes      |
| `generate_ssh_key`           | `false`        | If set to `true`, new ssh key pair will be created        | No       |
