### Requirements/Setup

 1. Create AWS S3 Bucket
You need a AWS S3 bucket. You will need an IAM user to access the S3 bucket.

 1. Create 'env.list' with your environment variables
You need to create a file named `env.list` and put the following values in it:

 ```
 AWS_S3_BUCKET=some-s3-bucket
 AWS_ACCESS_KEY_ID=aws-access-key
 AWS_SECRET_ACCESS_KEY=aws-secret-access-key
 ```
 
 1. Make sure Docker is configured and running by running `docker version`

 You should see output like this:
 ```
Client:
 Version:      1.9.0
 API version:  1.21
 Go version:   go1.4.3
 Git commit:   76d6bc9
 Built:        Tue Nov  3 19:20:09 UTC 2015
 OS/Arch:      darwin/amd64

Server:
 Version:      1.9.0
 API version:  1.21
 Go version:   go1.4.3
 Git commit:   76d6bc9
 Built:        Tue Nov  3 19:20:09 UTC 2015
 OS/Arch:      linux/amd64
```
 1. (optional) `make` is required to use the `Makefile`. If you don't have `make`, read the `Makefile` to see the Docker commands you'll need to run.

### Usage
Run `make`

This will:
 1. Download HashiCorp's Vault binary. Currently hardcoded to support my MacBook Pro.
 1. Build the Docker image
 1. Run the Docker image

### Demo
Checkout some samples in the [docs](docs/demo.md) folder.
