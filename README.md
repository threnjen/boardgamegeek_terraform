# terraform_modules
Set up the AWS tech stack for boardgamegeek to run on the cloud.

You must have administration level privileges to create these resources in AWS, or at least create/destroy privileges in the following areas: IAM, VPC. S3, ECR, ECS, Lambda

## Step 01 - Install Terraform

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

## Step 02 - Set up variable files

You'll need to set up TWO files before running terraform. Both of these files are made in the root directory.

#### .env file

Use the .env example file to create a file called `.env` with the keys and fill in the values.

For the IP env var:
- only enter the first three blocks x.x.x, anything more will throw an error
- on Mac, use `curl -4 ifconfig.co` to get your IP
- on Windows, use `ipconfig /all` to get your IP

Two of the variables are pre-filled. KEEP THESE AS IS.

#### backend.conf file

You will now set up an S3 bucket to store your terraform configuration files. 
Make a new file called `backend.conf` using `touch backend.conf`

In backend.conf you need to add two lines:

- `region="xxxxxx"` where xxxxxx = the value for `TF_VAR_region` from your .env file
- `bucket="xxxxxx"` where xxxxxx = the value for `TF_VAR_bucket` from your .env file

## Step 03 - Open command line to boardgamegeek_terraform directory

Export the variables from your .env file. If you use pipenv this is done automatically; otherwise, do it in your preferred way.

All remaining steps will fail if not done precisely in order.

## Step 04  - Install S3 state file bucket

Run the following commands:
`cd modules/s3_state_bucket`

Run in order:
- `terraform init`
- `terraform apply`

Wait for the evaluation to prompt you to proceed. Does everything look ok?
`yes`

## Step 05 - Set up VPC and project security groups

CD back out to the modules directory.
Run the following commands:
`cd vpc`

Run in order:
- `terraform init -backend-config ../../backend.conf`
- `terraform apply`

Wait for the evaluation to prompt you to proceed. Does everything look ok?
`yes`

This will set up to allow you to access the orchestrator elements from your browser in a secure manner. In order to maintain security, this is scoped to YOUR IP. 
### ANYTIME YOUR IP CHANGES, UPDATE THE ENV VAR AND RUN THIS STEP 05 AGAIN TO UPDATE

## Step 06 - Set up project resources

CD out to the main terraform_modules directory.

Run in order:
- `terraform init -backend-config backend.conf`
- `terraform apply`

Wait for the evaluation to prompt you to proceed. Does everything look ok?
`yes`

!!!!! YOU WILL HAVE ERRORS HERE. THIS IS EXPECTED !!!!!

It's time to set up your GitHub CI/CD so that your project files write to the AWS ECR. The AWS resources cannot complete setup until the project has been uploaded.

Open up the MAIN boardgamegeek project directory and complete all steps through the  "Set up GitHub Secrets" section, including pushing to the repo so that all of the projects deploy to their respective locations on AWS.

## Step 07 - Run the project again to finish creating the resources

CD out to the main terraform_modules directory.

Run in order:
- `terraform init -backend-config backend.conf`
- `terraform apply`

Wait for the evaluation to prompt you to proceed. Does everything look ok?
`yes`
