# Demo Tofu AWS

<img src="README.svg" alt="OpenTofu Logo" style="width: 100%;"/>

Demonstrate how to use:

* [OpenTofu](https://opentofu.org/) which is a fork of Terraform

* [Amazon Web Services](https://aws.amazon.com)

To create:

* a virtual server instance using AWS EC2 with Ubuntu.

* a virtual database using AWS RDS with PostgreSQL.

* a serverless function "hello world" using AWS Lambda.

* a simple storage service bucket using AWS S3.

And also set up:

* a user and policy using AWS IAM.

* a key pair for SSH access to the virtual server

* a virtual private cloud (VPC) with two subnets in multiple availability zones.

* a security group that permits SSH, HTTPS, PostgreSQL, etc.

Bonus extras:

* How to create and use Tofu variables, including descriptions and validations

* Configure AWS free tier variables for the AWS EC2 server and AWS RDS database.


## Tofu setup

Use the Tofu documentation.

  * Go to https://opentofu.org


To install on macoOS via brew:

```sh
brew update && brew install opentofu
```

Verify:

```sh
tofu -version
```


### Initialize

Run:

```sh
tofu init
```

```txt
Initializing the backend...

Initializing provider plugins...

OpenTofu has been successfully initialized!

You may now begin working with OpenTofu. Try running "tofu plan" to see
any changes that are required for your infrastructure. All OpenTofu commands
should now work.

If you ever set or change modules or backend configuration for OpenTofu,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```


### Typical commands

Typical commands:

  * `tofu validate` does a syntax check.

  * `tofu plan` shows what will run.

  * `tofu apply` runs it.

  * `tofu show` prints the results file.


## AWS setup


### Get your AWS account

Get an AWS account, if you don't already have one:

  * Go to https://aws.amazon.com/free/

  * Sign up.


### Get AWS command line software (optional)

To install AWS CIO on macOS via brew:

```sh
brew update && brew install awscli
```

To install AWS CLI via python pip:

```sh
pip install awscli --upgrade --user
```

Verify:

```sh
aws --version
```

```stdout
aws-cli/2.22.14 Python/3.12.6 Darwin/24.2.0 exe/x86_64
```


### Get your AWS security credentials

Get your AWS security credentials, if you don't already have them.

  * When you sign in the AWS website, the AWS console shows your username in the upper right.

  * Click your username. You see a dropdown menu. Click "Security Credentials".

  * If this is your first time using AWS, or if you are still using old-style credentials, then you may see a dialog box asking you to switch to best practices using AWS IAM; click the IAM button.


### Get your AWS user

You can run this demo by using any AWS user you want.

  * For example, you can run this as your own user, presuming the user has sufficient permissions.

  * We prefer to create a new AWS IAM user that is specific for this demo. We name the user "demo_tofu_aws" and we attach a custom policy by copying the JSON from the file [`demo_tofu_aws_policy.json`](demo_tofu_aws_policy.json).


### Create an AWS IAM user (optional)

Go to your AWS IAM users page, such as:

  * https://us-east-1.console.aws.amazon.com/iam/home#/users

  * Click "Create User"

  * Enter the user name "demo_tofu_aws"

  * Skip "Provide access to the AWS Management Console"

  * Click "Next"

  * Choose "Attach existing policies directly" because this is just for a demo.

  * In this repo, see the file `demo_tofu_aws_policy.json". Add the policy JSON to the user.

  * Click "Create User"

  * Click "Security Credentials".

  * See the section "Action keys", which describes: Use access keys to send programmatic calls to AWS from the AWS CLI, AWS Tools for PowerShell, AWS SDKs, or direct AWS API calls.

  * Click "Create Access Key".

  * If AWS prompts you for "Use Case", then choose "Local Code". This step doesn't matter because it's just a demo.

  * Skip "Set description tag".

  * Click "Create Access Key".

  * Example Access Key: 6IAIN7RHCYWDYJAHV8LS (optionally save to a file access_key.txt)

  * Example Secret Access Key: OJif8/L9UgHqfJzkO3RDqEcypvWkilfkfe8N5YOO (optionally save to a file secret_access_key.txt)


### Create an AWS IAM policy (optional)

Authorize the Tofu user, if you need to.

To set up the policy:

  * Go to https://console.aws.amazon.com/iam/home

  * Choose the user "demo_tofu_aws" user (or whatever you call your user)

  * You see the "Set Permissions" page.

  * Choose the "Permissions" tab

Option 1 - choose the Administration policy:

  * This is a good option if you want to get up and running easily, and the AWS system is low value.

  * Click the row "Managed Policies"

  * Click the button "Attach Policies".

Option 2 - choose a custom policy:

  * This is a good option if you need to be cautious with your AWS systems, such as protecting them from accidential deletions of servers.

  * Click the row "Inline Policies"

  * Click the button "Create User Policy".

  * Click the "Select" button.

  * Policy Name: demo_tofu_aws (or anything you want)

  * Policy Document: create the policy you want, such as [these examples](doc/policies)

  * Click the button "Validate Policy". If it's not valid, then keep working on it; do not apply it.

  * Click the button "Apply Policy".


## Tofu and AWS


### Configure

Create a Tofu configuration file `main.tf`:

```tofu
terraform {
}
```


### tofu plan

Plan example.

Run:

```sh
tofu plan
```

```stdout
No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed
```


### tofu apply

Run:

```sh
tofu apply
```

```stdout
tofu apply

No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```


### Add aws provider

Append `main.tf`:

```tofu
provider "aws" {
}
```

Credentials can be provided by environment variables, rather than hard-coded in the configuration:

```sh
export AWS_ACCESS_KEY_ID="6IAIN7RHCYWDYJAHV8LS"
export AWS_SECRET_ACCESS_KEY="OJif8/L9UgHqfJzkO3RDqEcypvWkilfkfe8N5YOO"
export AWS_REGION="us-east-1"
```

Run:

```sh
tofu apply
```


### Initialize

Run:

```sh
tofu init
```

```stdout
Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.82.2...
- Installed hashicorp/aws v5.82.2 (signed, key ID 0C0AF313E5FD9F80)
Initializing provider plugins...
- Checking for available provider plugins on https://releases.hashicorp.com...
…
```


## Key pair

Generate a key pair via the command line.

Command line quick generation without a passphrase

* -t ed25519 = Edwards-curve Digital Signature Algorithm for key generation.
* -N "" = avoids setting a paraphrase (secret used to protect an encryption key).
* -C "Demo Tofu" = text description
* -m pem = Privacy-Enhanced Mail format for key generation and storage; required by AWS
* -f demo_tofu_aws_key_pair = file name for the key pair

```sh
ssh-keygen -t ed25519 -N "" -C "Demo Tofu AWS" -m pem -f demo_tofu_aws_key_pair
```

This command is also available in the `bin` directory:

* [`bin/random-password`](bin/random-password)


### Congratulations

Congratulations, you're up and running!


## EC2 instance

Now that the EC2 instance is running, you can connect to it via SSH.

* Instance id such as: `i-013a51d0dece9027d`

* Public DNS such as `ec2-44-201-161-6.compute-1.amazonaws.com`


### Get console output

Get console output, including the necessary SSH fingerprints:

```sh
aws ec2 get-console-output --region "us-east-1" --instance-id "i-013a51d0dece9027d" | jq -r .Output
```


### SSH to EC2 instance

Connect to the instance via SSH by using this syntax and with very verbose output to help you the first time:

```sh
ssh -vv -F /dev/null -o IdentitiesOnly=yes -i <private key filename> <username@hostname>
```

Example:

```sh
ssh -vv -F /dev/null -o IdentitiesOnly=yes -i demo_tofu_aws_key_pair ubuntu@ec2-44-201-161-6.compute-1.amazonaws.com
```


## Troubleshooting


### VPC resource not specified

Issue: `tofu apply` failed due to VPC resource not specified.

   * Error message: aws_instance.example: Error launching source instance: VPCResourceNotSpecified: The specified instance type can only be used in a VPC. A subnet ID or network interface ID is required to carry out the request.

  * See this issue: https://github.com/hashicorp/terraform/issues/4367

  * Workaround is to change to an AMI and instance that do not need a VPC.

Example:

```tf
resource "aws_instance" "example" {
  ami = "ami-408c7f28"
  instance_type = "t1.micro"
}
```


### Unauthorized operation

Issue: `tofu apply` failed due to unauthorized operation.

  * Error message: aws_instance.example: Error launching source instance: UnauthorizedOperation: You are not authorized to perform this operation. Encoded authorization failure message...

  * See this issue: https://github.com/hashicorp/terraform/issues/2834

  * The solution is to use policy; we recommend the policy that is described in the issue above, thanks to [https://github.com/artburkart](https://github.com/artburkart)
