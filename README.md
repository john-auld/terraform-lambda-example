# terraform-lambda-example

## Setup resources

Create a S3 buckets for the Terraform backend state and for uploading Lambda function code.

```bash
aws cloudformation create-stack --stack-name bjss-demo --template-body file://cloudformation/s3_backend.yml --region eu-west-2
```


## Terraform lambda function example

The app directory contains a simple, hello world example function.

Add the file main.js to example.zip and save the file in the root folder of this project.

Upload the zip file to S3

```bash
aws s3 cp example.zip s3://lambda-function-upload-ja/v1.0.0/example.zip
```