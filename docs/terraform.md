## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| generate_ssh_key | If set to `true`, new SSH key pair will be created | bool | `false` | no |
| name | Application or solution name (e.g. `app`) | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | `` | no |
| private_key_extension | Private key extension | string | `` | no |
| public_key_extension | Public key extension | string | `.pub` | no |
| ssh_key_algorithm | SSH key algorithm | string | `RSA` | no |
| ssh_public_key_path | Path to SSH public key directory (e.g. `/secrets`) | string | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | `` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| key_name | Name of SSH key |
| private_key_filename | Private Key Filename |
| public_key | Content of the generated public key |
| public_key_filename | Public Key Filename |

