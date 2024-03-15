# Flask REST API on Kubernetes with CI/CD Pipeline

This project demonstrates how to deploy a Flask REST API on Kubernetes using Docker containers, Terraform for infrastructure provisioning, and GitHub Actions for continuous integration and continuous deployment (CI/CD) pipeline. The API returns hostname, datetime, version, and weather data for Dhaka using a free 3rd party weather API.



## Prerequisites

Before running this project, ensure you have the following prerequisites installed and configured:

- Docker
- Terraform
- kubectl
- AWS CLI
- GitHub account
- Docker Hub account

## Setup Instructions

1. Clone the repository:

    ```bash
    git clone https://github.com/nahidd/BS-23.git
    cd BS-23
    ```

2. Update the API key in `api/api.py` with your own API key.

3. Customize any other configurations according to your requirements.

4. Build and push the Docker image to Docker Hub:

    ```bash
    docker build -t donahid/my-api:latest .
    docker push donahid/my-api:latest
    ```

5. Provision the Kubernetes cluster using Terraform:

    ```bash
    cd terraform
    terraform init
    terraform apply
    ```

6. Deploy the application to Kubernetes:

    ```bash
    kubectl apply -f kubernetes-manifests/
    ```

7. Access your API using the LoadBalancer endpoint provided by your Kubernetes service.

## Continuous Integration and Continuous Deployment (CI/CD)

The project includes a CI/CD pipeline configured with GitHub Actions. Whenever a new release is created, the pipeline automatically builds the Docker image, pushes it to Docker Hub, and deploys the application to the Kubernetes cluster.


## Task 2

The `Task 2` folder contains the cloud architectural design.
