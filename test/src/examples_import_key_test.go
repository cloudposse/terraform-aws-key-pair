package test

import (
	"io/ioutil"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// Test the Terraform module in examples/complete using Terratest.
func TestImportKey(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/import-key",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-east-2.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// Create dummy SSH key and write to file
	keyPair, err := ssh.GenerateRSAKeyPairE(t, 2048)
	if err != nil {
		require.NoError(t, err)
	}

	err = ioutil.WriteFile("/tmp/secrets/id_rsa_test.pub", []byte(keyPair.PublicKey), 0600)
	if err != nil {
		require.NoError(t, err)
	}

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Verify `key_name` output is as expected
	keyName := terraform.Output(t, terraformOptions, "key_name")

	expectedKeyName := "eg-test-aws-key-pair"
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedKeyName, keyName)

	// Verify `public_key` output is as expected
	publicKey := terraform.Output(t, terraformOptions, "public_key")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, strings.TrimSuffix(keyPair.PublicKey, "\n"), publicKey)

	// Verify `public_key_filename` output is as expected
	publicKeyFileName := terraform.Output(t, terraformOptions, "public_key_filename")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, "/tmp/secrets/id_rsa_test.pub", publicKeyFileName)
}
