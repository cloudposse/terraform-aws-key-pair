package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/dont-store using Terratest.
func TestExamplesDontStore(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/dont-store",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	keyName := terraform.Output(t, terraformOptions, "key_name")
	publicKeyFilename := terraform.Output(t, terraformOptions, "public_key_filename")
	privateKeyFilename := terraform.Output(t, terraformOptions, "private_key_filename")

	expectedKeyName := "eg-test-aws-key-pair"
	expectedPublicKeyFilename := ""
	expectedPrivateKeyFilename := ""
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedKeyName, keyName)
	assert.Equal(t, expectedPublicKeyFilename, publicKeyFilename)
	assert.Equal(t, expectedPrivateKeyFilename, privateKeyFilename)
}
