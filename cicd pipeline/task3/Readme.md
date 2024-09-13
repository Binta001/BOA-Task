# Jenkins Pipeline for AWS Lambda Deployment

This guide provides instructions for setting up a Jenkins pipeline to automate the deployment of a serverless application to AWS Lambda. The pipeline includes stages for linting, testing, packaging, uploading to S3, and deploying to Lambda.

## Features

- **Code Linting:** Run ESLint to ensure code quality.
- **Automated Testing:** Execute tests to verify application functionality.
- **Build and Package:** Create a ZIP file of your application code.
- **Upload to S3:** Upload the deployment package to an S3 bucket.
- **Deploy to Lambda:** Update the Lambda function with the new code.

## Prerequisites

- **Jenkins:** Ensure Jenkins is installed and operational.
- **AWS CLI:** Install and configure AWS CLI with your AWS credentials.
- **Git:** Required for source code management.
- **Node.js and npm:** Necessary for linting and testing if your application is a Node.js app.

## Setup Instructions

### 1. Clone the Repository

Clone the repository containing the Jenkins pipeline configuration:

```bash
git clone https://github.com/yourusername/your-repo.git
cd your-repo

### 2. Configure AWS Credentials

To enable Jenkins to interact with AWS services, configure AWS CLI with your AWS credentials:

1. **Install AWS CLI:**

   Ensure AWS CLI is installed on your Jenkins server. You can install it using the following commands:

   - For macOS:

     ```bash
     brew install awscli
     ```

   - For Ubuntu/Debian:

     ```bash
     sudo apt-get update
     sudo apt-get install awscli
     ```

   - For Windows, follow the instructions on the [AWS CLI Installation page](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

2. **Configure AWS CLI:**

   Run the following command to configure your AWS credentials:

   ```bash
   aws configure

You will be prompted to enter the following information:

- **AWS Access Key ID:** Your AWS access key.
- **AWS Secret Access Key:** Your AWS secret key.
- **Default region name:** The AWS region where your Lambda function is deployed (e.g., `us-east-1`).
- **Default output format:** You can leave this as `json`.

Alternatively, set environment variables for AWS credentials:

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"


Ensure these environment variables are available to Jenkins by configuring them in Jenkins global settings or directly in the Jenkins job configuration.

### 3. Set Up Jenkins

To set up the Jenkins pipeline job, follow these steps:

#### Log in to Jenkins:

Access your Jenkins dashboard by navigating to `http://<your-jenkins-url>` in your web browser.

#### Create a New Pipeline Job:

- Click on **"New Item"** on the left-hand menu.
- Enter a name for your job, e.g., `AWS Lambda Deployment Pipeline`.
- Select **"Pipeline"** and click **"OK"**.

#### Configure the Pipeline:

- Scroll down to the **"Pipeline"** section.
- In the **"Definition"** field, select **"Pipeline script"**.
- Paste the Jenkins pipeline script into the **"Script"** text box. Ensure you replace placeholders with your specific values (e.g., `your-lambda-function-name`, `your-s3-bucket-name`).

#### Save the Configuration:

- Click **"Save"** to create the pipeline job.

#### Run the Pipeline:

- You can trigger the pipeline manually by clicking **"Build Now"** in the left-hand menu of your pipeline job.
- Alternatively, configure a webhook or other triggers to automate the pipeline execution based on code changes or other events.


### 4. Verify Deployment

#### Check AWS Lambda Console:

Ensure your Lambda function has been updated with the new code by checking the AWS Lambda console.

#### Review Jenkins Build Logs:

Monitor Jenkins build logs for any issues or errors that may have occurred during the pipeline execution.
