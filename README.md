# Blue-Green Deployment with Node.js and GitHub Actions 🚀

This project demonstrates a **Blue-Green Deployment** pipeline using:

- **Node.js** for a sample web server
- **GitHub Actions** for CI/CD
- **PM2** for process management
- **EC2** instance on AWS as the deployment target

---

## 📁 Project Structure

blue-green-deployment/
│
├── blue-app/ # Blue version of the app (HTML)
│ └── index.html
│
├── green-app/ # Green version of the app (HTML)
│ └── index.html
│
├── nginx/ # NGINX config for reverse proxy
│ └── nginx.conf
│
├── index.js # Entry point of Node.js app
├── package.json # Node.js dependencies
├── deploy.sh # Optional deployment script
├── docker-compose.yml # Docker orchestration (if needed)
│
├── .github/
│ └── workflows/
│ └── deploy.yml # GitHub Actions CI/CD pipeline
│
└── ci_cd_deploy_key # SSH private key for deployment (in .gitignore)

yaml
Copy
Edit

---

## 🚀 Deployment Flow

1. Developer **pushes code to `main`** branch.
2. GitHub Actions runs the workflow:
   - Connects to the EC2 server via SSH using `DEPLOY_KEY`
   - Installs Node.js and PM2 if missing
   - Clones the latest code from GitHub
   - Runs `npm install`
   - Starts or restarts the app with PM2

---

## 🔧 Setup Instructions

### 🖥️ 1. EC2 Setup

- Launch an Ubuntu EC2 instance
- Add SSH key (e.g., `ci_cd_deploy_key.pub`) to:
  ```bash
  ~/.ssh/authorized_keys
Ensure the instance allows port 3000 (or whichever port your app uses) in Security Group

🔐 2. GitHub Secrets
Go to Repository → Settings → Secrets → Actions → New repository secret:

Name	Value (example)
DEPLOY_KEY	Paste the private key (ci_cd_deploy_key) contents

🛠️ 3. Edit Workflow (.github/workflows/deploy.yml)
Ensure your workflow points to the right:

EC2 public IP (host)

GitHub repo clone URL

Directory structure (~/blue-green-deployment)


This is the project link: https://roadmap.sh/projects/blue-green-deployment
