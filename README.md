## Overview
Using Terraform Workspaces, I implemented a setup with three AWS accounts:
- The main account
- The streaming account
- The warehouse account

### The main account
The main role extends trust to the streaming and warehouse accounts, allowing users from the streaming and warehouse accounts to use roles defined in the main account. A user from the main or streaming account can assume a role from the main account and access shared resources using the attached policies.

### The streaming account
Firehose unloads the streams as JSON files to S3.

### The warehouse account
A lambda function is triggered every time a JSON file is added to the events buckets. The lambda function copies the file contents to Redshift.

## Usage
- Install Terraform v1.0.6
- Fill in the configuration and credential settings for the 3 accounts:
    - `main/env_vars/main.tfvars`
    - `environments/env_vars/streaming.tfvars`
    - `environments/env_vars/warehouse.tfvars`
- Provision the shared resources:
    - `cd main`
    - `terraform workspace new main`
    - plan: `ENV=main make plan`
    - apply: `ENV=main make apply`
- Provision the streaming and warehouse resources:
    - `cd environments`
    - `terraform workspace new streaming`
    - plan: `ENV=streaming make plan`
    - apply: `ENV=streaming make apply`
    - `terraform workspace new warehouse`
    - plan: `ENV=warehouse make plan`
    - apply: `ENV=warehouse make apply`

## Notes
### Concerns:
- Compress S3 files and increase the S3 buffer size to reduce long-term storage costs.

### Pending:
- Set up AWS Secrets Manager to provide sensitive env variables to lambda.
- Prepare cost estimates per service
- Provide scaling metrics
