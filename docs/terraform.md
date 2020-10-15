<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |
| aws | >= 2.0 |
| local | ~> 1.3 |
| null | ~> 2.1 |
| tls | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |
| local | ~> 1.3 |
| tls | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| generate\_ssh\_key | If set to `true`, new SSH key pair will be created and `ssh_public_key_file` will be ignored | `bool` | `false` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| private\_key\_extension | Private key extension | `string` | `""` | no |
| public\_key\_extension | Public key extension | `string` | `".pub"` | no |
| ssh\_key\_algorithm | SSH key algorithm | `string` | `"RSA"` | no |
| ssh\_public\_key\_file | Name of existing SSH public key file (e.g. `id_rsa.pub`) | `string` | `null` | no |
| ssh\_public\_key\_path | Path to SSH public key directory (e.g. `/secrets`) | `string` | n/a | yes |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_name | Name of SSH key |
| private\_key | Content of the generated private key |
| private\_key\_filename | Private Key Filename |
| public\_key | Content of the generated public key |
| public\_key\_filename | Public Key Filename |

<!-- markdownlint-restore -->
