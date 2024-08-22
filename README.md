# LWA Repro

Repro for https://github.com/awslabs/aws-lambda-web-adapter/issues/491

## Step 1

Build the container image: `docker build --platform linux/arm64 --tag lwa-repro .`

(Push the container image to an ECR repository which your AWS account has access to, which you will need for the next step.)

## Step 2

Create a new Lambda function from the container image from Step 1. Specify the `arm64` architecture.

## Step 3

Edit the Lambda function to enable a Function URL with no authorization.

## Step 4

Invoke the Lambda function with a `GET` request and a query string parameter to the Function URL:

```bash
curl -vvqs "https://{FUNCTION_URL}/?q=a+b"
```

Observe "Internal Server Error" and "500" status code in the response.

If you change the query string to `q=a%20b`, the request will succeed.
