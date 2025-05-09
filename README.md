# Persistent Uptime Kuma on Azure App Services (with Terraform)
![Monitoring Probes](/assets/kuma-sc4.png)
## 📘 Overview
This repository demonstrates how to deploy [**Uptime Kuma**](https://github.com/louislam/uptime-kuma), a self-hosted uptime monitoring tool, on **Azure App Services** using **Terraform**. The project includes persistent storage using **Azure File Shares**, and a live setup that monitors multiple endpoints.
## 🛠️ Features

- 🚀 Deployed on Azure App Services (Linux)
- 📦 Containerized Uptime Kuma instance
- 🧱 Infrastructure managed with Terraform
- 💾 Persistent data storage via Azure File Share
- 👀 Live monitoring of multiple websites (Google, Facebook, Azure host, etc.)
- ✅ Working example probes visible in screenshot
- ## 📊 Monitored Targets

- `https://google.com`
- `https://facebook.com`
- Your deployed Uptime Kuma's own URL
- `https://example.com`
- A bogus/non-existent domain (to show failure state)
- ## 🧰 Tech Stack

- **Terraform** for Infrastructure as Code (IaC)
- **Azure App Service** (Linux, Docker)
- **Azure Storage Account** with **File Share**
- **Docker** (Uptime Kuma image)
- ## 🧱 Architecture

- Uptime Kuma runs as a container inside an Azure Linux Web App.
- A mounted Azure File Share provides persistent storage at `/app/data`.
- Terraform provisions all required Azure infrastructure (App Service Plan, Web App, Storage Account, File Share, Mount).
- Monitoring probes are configured manually via the Kuma dashboard.
## 🚀 Deployment Instructions

> Make sure you have Azure CLI, Terraform, and Docker installed and configured.
> ### 1. Clone the repository

```bash
git clone https://github.com/glitcher255/Terraform-Kuma-App.git
cd Terraform-Kuma-App
```
> ### 2. Configure your Terraform backend
> Set up and configure your Terraform backend remote provider organization in ```providers.tf```
> 
> Store your Terraform Auth token in GitHub Actions environment variables
```TF_TOKEN_app_terraform_io```
> ### 3. Configure your storage account
> Make sure your storage account is globally unique in ```Modules/storage_account/sa_main.tf``` at ```name:"your0unique0storage0account0name"```
> ### 4. Deploy using Terraform
```bash
terraform init
terraform apply -auto-approve
```
## 🧪 Post-Deployment Setup
After first login:

Set up your admin user.

Add monitoring targets via the dashboard.

They will be saved in /app/data which is mapped to your Azure File Share.

## 📄 License
This project is licensed under the MIT License. See the LICENSE file for details.

Maintainer: [Glitcher255](https://github.com/glitcher255)
