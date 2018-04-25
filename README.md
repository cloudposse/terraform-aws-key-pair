# terraform-aws-key-pair [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-key-pair.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-key-pair)

Terraform module for generating an SSH public key file.

## Usage

```hcl
module "ssh_key_pair" {
  source                = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=master"
  namespace             = "cp"
  stage                 = "prod"
  name                  = "app"
  ssh_public_key_path   = "/secrets"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
  chmod_command         = "chmod 600 %v"
}
```


## Variables

|  Name                        |  Default       |  Description                                             | Required  |
|:-----------------------------|:--------------:|:---------------------------------------------------------|:---------:|
| `namespace`                  | ``             | Namespace (e.g. `cp` or `cloudposse`)                    | Yes       |
| `stage`                      | ``             | Stage (e.g. `prod`, `dev`, `staging`)                    | Yes       |
| `name`                       | ``             | Application or solution name  (e.g. `app`)               | Yes       |
| `ssh_public_key_path`        | ``             | Path to SSH public key directory (e.g. `/secrets`)       | Yes       |
| `private_key_extension`      | ``             | Private key file extension (_e.g._ `.pem`)               | No        |
| `public_key_extension`       | `.pub`         | Public key file extension (_e.g._ `.pub`)                | No        |
| `chmod_command`              | `chmod 600 %v` | Template of the command executed on the private key file | Yes(Linux), No(Windows) |

## Outputs

| Name                  | Description                                   |
|:----------------------|:----------------------------------------------|
| `key_name`            | Name of SSH key                               |
| `public_key`          | Contents of the generated public key          |


## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-key-pair/issues), send us an [email](mailto:hello@cloudposse.com) or reach out to us on [Gitter](https://gitter.im/cloudposse/).


## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-key-pair/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing `terraform-aws-key-pair`, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!


## License

[APACHE 2.0](LICENSE) © 2017-2018 [Cloud Posse, LLC](https://cloudposse.com)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## About

`terraform-aws-key-pair` is maintained and funded by [Cloud Posse, LLC][website].

![Cloud Posse](https://cloudposse.com/logo-300x69.png)


Like it? Please let us know at <hello@cloudposse.com>

We love [Open Source Software](https://github.com/cloudposse/)!

See [our other projects][community]
or [hire us][hire] to help build your next cloud platform.

  [website]: https://cloudposse.com/
  [community]: https://github.com/cloudposse/
  [hire]: https://cloudposse.com/contact/


### Contributors

| [![Erik Osterman][erik_img]][erik_web]<br/>[Erik Osterman][erik_web] | [![Andriy Knysh][andriy_img]][andriy_web]<br/>[Andriy Knysh][andriy_web] |
|-------------------------------------------------------|------------------------------------------------------------------|

  [erik_img]: http://s.gravatar.com/avatar/88c480d4f73b813904e00a5695a454cb?s=144
  [erik_web]: https://github.com/osterman/
  [andriy_img]: https://avatars0.githubusercontent.com/u/7356997?v=4&u=ed9ce1c9151d552d985bdf5546772e14ef7ab617&s=144
  [andriy_web]: https://github.com/aknysh/
