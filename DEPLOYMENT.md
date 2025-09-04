# 🚀 Tour Management App - CI/CD Deployment Guide

This guide explains how to set up automated deployment of your Tour Management application to Docker Hub using GitHub Actions.

## 📋 Prerequisites

1. **Docker Hub Account**: Create an account at [hub.docker.com](https://hub.docker.com)
2. **GitHub Repository**: Your code should be in a GitHub repository
3. **Docker Hub Access Token**: Generate a personal access token

## 🔐 Setting Up GitHub Secrets

### Step 1: Create Docker Hub Access Token

1. Go to [Docker Hub](https://hub.docker.com)
2. Click on your profile → **Account Settings**
3. Go to **Security** tab
4. Click **New Access Token**
5. Give it a name (e.g., "GitHub Actions")
6. Set permissions to **Read, Write, Delete**
7. Copy the generated token (you won't see it again!)

### Step 2: Add Secrets to GitHub Repository

1. Go to your GitHub repository
2. Click **Settings** tab
3. In the left sidebar, click **Secrets and variables** → **Actions**
4. Click **New repository secret**
5. Add these two secrets:

| Secret Name | Value | Description |
|-------------|-------|-------------|
| `DOCKER_USERNAME` | Your Docker Hub username | Your Docker Hub username |
| `DOCKER_HUB_TOKEN` | Your access token | The token you generated in Step 1 |

## 🔄 How the CI/CD Pipeline Works

### Trigger Events
- **Push to main/master branch**: Builds and deploys to Docker Hub
- **Pull Request**: Builds and tests (no deployment)

### Pipeline Steps
1. **Checkout Code**: Gets your latest code
2. **Docker Build**: Builds your application image
3. **Docker Push**: Pushes to Docker Hub with tags
4. **Deployment Summary**: Shows deployment results

### Image Tags
- `latest`: Always points to the latest main/master branch
- `main-abc1234`: Branch name + commit SHA
- `master-abc1234`: Branch name + commit SHA

## 🏃‍♂️ Running the Pipeline

### Automatic Deployment
1. Make changes to your code
2. Commit and push to main/master branch
3. GitHub Actions automatically:
   - Builds your Docker image
   - Pushes to Docker Hub
   - Updates the `latest` tag

### Manual Deployment
1. Go to your GitHub repository
2. Click **Actions** tab
3. Select **Build and Deploy Tour Management App**
4. Click **Run workflow**
5. Choose branch and click **Run workflow**

## 📦 Using Your Deployed Image

Once deployed, anyone can run your application:

```bash
# Pull the latest image
docker pull YOUR_DOCKER_USERNAME/tour-management-app:latest

# Run the application
docker run -d -p 8080:80 --name tour-management YOUR_DOCKER_USERNAME/tour-management-app:latest
```

## 🔍 Monitoring Deployments

### GitHub Actions Dashboard
- Go to **Actions** tab in your repository
- See all workflow runs and their status
- Click on any run to see detailed logs

### Docker Hub
- Visit your repository: `https://hub.docker.com/r/YOUR_USERNAME/tour-management-app`
- See all image tags and their sizes
- View pull statistics

## 🛠️ Troubleshooting

### Common Issues

1. **Authentication Failed**
   - Check if `DOCKER_USERNAME` and `DOCKER_HUB_TOKEN` are set correctly
   - Verify the token has proper permissions

2. **Build Failed**
   - Check the Actions logs for specific error messages
   - Ensure your Dockerfile is in the root directory

3. **Push Failed**
   - Verify your Docker Hub account has space
   - Check if the repository name matches your username

### Getting Help
- Check GitHub Actions logs for detailed error messages
- Verify your Docker Hub token permissions
- Ensure your repository secrets are set correctly

## 📈 Next Steps

1. **Set up the secrets** as described above
2. **Push your code** to trigger the first deployment
3. **Monitor the Actions tab** to see the pipeline in action
4. **Test your deployed image** by pulling and running it

## 🎉 Success!

Once everything is set up, your Tour Management application will automatically deploy to Docker Hub every time you push changes to the main branch!

---

**Need help?** Check the GitHub Actions logs or review this guide step by step.
