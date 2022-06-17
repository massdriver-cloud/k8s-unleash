# k8s-unleash

Unleash is a open source feature flag & toggle system, that gives you a great overview over all feature toggles across all your applications and services. It comes with official client implementations for Java, Node.js, Go, Ruby, Python and .NET Core.

### Development

### Enabling Pre-commit

This repo includes Terraform pre-commit hooks.

[Install precommmit](https://pre-commit.com/index.html#installation) on your system.

```shell
mv pre-commit-config.yaml .pre-commit-config.yaml
pre-commit install
```

Terraform hooks will now be run on each commit.
