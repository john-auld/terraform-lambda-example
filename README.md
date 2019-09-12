# terraform-lambda-example

## Setup resources

Create the S3 buckets for the Terraform backend state and for uploading Lambda function code using CloudFormation.

```bash
aws cloudformation create-stack --stack-name lambda-demo --template-body file://cloudformation/s3_resources.yml --region eu-west-2
```


## Terraform lambda function example

The app directory contains a simple, hello world example function.

Add the file main.js to example_v{app_version}.zip and save the file in the root folder of this project.

### Upload the zip file to S3

```bash
aws s3 cp example.zip s3://ja-lambda-function-upload/example_v1.0.0.zip
```

### Run terraform plan and apply

Check the output of terraform plan before running apply.

```bash
terraform plan
terraform apply -var="app_version=1.0.0"  --auto-approve
```

### Text the lambda function

```bash
aws lambda invoke --region=eu-west-2 --function-name=ServerlessExample output.txt
{
    "StatusCode": 200,
    "ExecutedVersion": "$LATEST"
}

# Linux / Mac / PowerShell terminals
cat output.txt
rm output.txt
{
  "statusCode":200,
  "headers":{
    "Content-Type":"text/html; charset=utf-8"
  },
  "body":"<p>Hello world!</p>"
}
```

### Upgrade or downgrade the release version

The steps below should be followed to upgrade or downgrade the release version.

```bash
# If necessary, upload desired release application version
aws s3 cp example.zip s3://ja-lambda-function-upload/example_v1.0.1.zip

# Update lambda function
terraform plan
terraform apply -var "app_version=1.0.1"  --auto-approve
```