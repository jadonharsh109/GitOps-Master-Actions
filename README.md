
# GitOps Master Actions


This repository is designed to help you automate key stages in your software development workflow using GitHub Actions.

## What You Will Learn

- **Automated Workflows**: How to write CI/CD workflows with GitHub Actions.
- **Environment Setup**: Setting up your development environment with Java, Docker, and Terraform.
- **Code Analysis**: Using SonarQube to ensure your code quality.
- **Docker Builds**: How to containerize your application using Docker.
- **Security Scanning**: Checking Docker images for security vulnerabilities using Dockle.

## Additional Features

- **Docker Integration**: Configuration files for Docker and Docker Compose to run your application in containers.
- **Kubernetes Support**: Manifest files for deploying your application on Kubernetes.

## Pull Request (PR) Process

- **Staging Server Creation**: When a PR is created, Terraform automatically begins the creation of a new staging server.
- **URL Commenting**: Terraform posts a comment in the PR with the URL to the newly created staging website.
- **Staging Server Cleanup**: Upon successful merge of the PR into the main branch, the staging server is taken down.

## Deployment Stages

- **Pre-Production**: After merging the PR into the main branch, the project enters the pre-production stage, getting ready for the final release.
## GitHub Action Workflow

[![](https://app.eraser.io/workspace/9rtTg2KRfxOuTHf0KGEG/preview?elements=3jhk6CvThYdnmBvDh1iByw&type=embed)](https://app.eraser.io/workspace/9rtTg2KRfxOuTHf0KGEG?elements=3jhk6CvThYdnmBvDh1iByw)


## Environment Variables

To run this project, you will need to add the following environment variables to your Repository secrets.

`DEPLOY_KEY` - SSH key to login EC2 instance

`DOCKERHUB_TOKEN` Password for DockerHub Account

`DOCKERHUB_USERNAME` Username of DockerHub Account

`SONAR_HOST_URL` SonarQube Server URL

`SONAR_TOKEN` Admin Access Token to access Sonar Projects

`TF_API_TOKEN` Terraform Cloud API Access Token





## Terraform Cloud Configuration

Configure your terraform cloud orgainization and workspace also setup *AWS Access_Key* and *AWS_Secret_Key* Edit terraform.tf files and change the below lines.

```bash
terraform {
  cloud {
    organization = "jadonharsh"

    workspaces {
      name = "GitOps-Master-Actions"
    }
  }
}
```

## Tools & Technologies

- **AWS**: Cloud platform for hosting and running services.
- **Terraform**: Infrastructure as Code tool to create and manage cloud resources.
- **Docker**: Container platform for packaging and distributing applications.
- **GitHub Actions**: Automation of workflows to build, test, and deploy your applications.
- **Kubernetes**: Container orchestration system for managing application deployment.
- **SonarQube**: Code quality and security tool.
- **Dockle**: Container image linter for security best practices.
- **ArgoCD**: Declarative continuous deployment tool for Kubernetes.
