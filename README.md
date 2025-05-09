# CI/CD Pipeline Deployment to AWS EC2 Using GitHub Actions
Welcome to the official repository of **[Company Name]** where we automate the deployment of our backend service using **GitHub Actions**, **Docker**, and **AWS EC2**.

## 🛠️ Deployment Steps

### 1. CI Pipeline (GitHub Actions)
Created CI pipeleine.


Logs into DockerHub using credentials stored in GitHub Secrets:
- DOCKER_USERNAME
- DOCKER_PASSWORD
Push code to the main branch triggers the CI pipeline.
Builds a Docker image using the provided Dockerfile.
Tags and pushes the image to DockerHub repository: jackson216/cicd-pipeline.

### 2. CD Pipeline (GitHub Actions on EC2)

- GitHub self-hosted runner runs on AWS EC2.
- When CI completes:
  - Pulls latest Docker image from DockerHub.
  - Stops and removes old container (if exists).
  - Runs the updated container exposing port 8080

### 3. EC2

- EC2 Ubuntu 24.04 instance is used.
- Security group allows HTTP (port 80) ,HTTPS(443) SSH (22)
- Validate with:
  ```bash
  curl http://<your-ec2-ip>
