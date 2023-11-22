# mini-mono

Discovery for `terraform test` replicating a mono repo with modules

## Getting Started

Navigate to the module

```shell
cd ./modules/bucket
```

Initialise the module

```shell
terraform init
```

Set your gcloud ADC

```shell
gcloud auth application-default login
```

And environment variables

```shell
export GOOGLE_CLOUD_PROJECT="..."
```

## Run the tests

You can run all tests within the modules `tests/` folder by running:

```shell
terraform test
```

You should get the following output

```shell
tests/integration.tftest.hcl... in progress
  run "integration_test"... pass
tests/integration.tftest.hcl... tearing down
tests/integration.tftest.hcl... pass
tests/unit.tftest.hcl... in progress
  run "unit_test_valid_name"... pass
  run "unit_test_invalid_location"... pass
tests/unit.tftest.hcl... tearing down
tests/unit.tftest.hcl... pass

Success! 3 passed, 0 failed.
```

You can also specify tests to run. 

A file naming pattern has been used to separate unit tests (plan) from integrations tests (apply).

```shell
terraform test -filter=tests/unit.tftest.hcl
terraform test -filter=tests/integration.tftest.hcl
```