# 3-Tier DevSecOps Project

This repository contains a simple Node.js Backend and a React Frontend used for a user management demo application. Follow the steps below to get the project running locally.

## Setup

1. Install Node.js (version 18 or later is recommended).
2. Install dependencies for both the API and client:

   ```bash
   cd Backend && npm install
   cd ../Frontend && npm install
   ```

3. Start the API server:

   ```bash
   cd Backend
   npm start
   ```

4. In a separate terminal, start the React client:

   ```bash
   cd Frontend
   npm start
   ```

5. Open `http://localhost:3000` in your browser to use the application.

The Frontend now displays an animated banner welcoming you to **DevOps Shack**.

## Terraform remote state (S3 backend)

The Terraform config under `automation-framework/terraform` is now configured to store its state remotely in an S3 bucket (see `backend.tf`). To use it:

1. Create an S3 bucket (recommended: enable versioning and encryption).
2. Create a DynamoDB table for state locking (e.g. `terraform-locks`) with a primary key named `LockID` (string).
3. Update `automation-framework/terraform/backend.tf` with your bucket name, region, key, and DynamoDB table name.
4. From `automation-framework/terraform`, run:
   ```bash
   terraform init
   ```

If you prefer not to hardcode values in `backend.tf`, you can also pass them via `terraform init -backend-config`.

## Jenkins: SSH key for Ansible targets

If you run the pipeline from Jenkins, the Ansible stage uses an SSH key stored in Jenkins credentials to connect to the target hosts.

1. In Jenkins, create a credential of type **"SSH Username with private key"**.
   - **ID:** `ansible-ssh-key`
   - **Username:** the remote SSH user (e.g., `ec2-user`/`ubuntu`)
   - **Private key:** your SSH private key

2. Ensure the target hosts have the matching public key in `~/.ssh/authorized_keys` for that user.

3. Ensure the Jenkins host can reach the targets via SSH (security group / firewall rules allow port 22 from the Jenkins host).

The pipeline already invokes Ansible using this credential (see `automation-framework/Jenkinsfile_CICD`).
