# 🚀 Quick Setup Guide for GitHub Actions CI/CD

## Step 1: Create Docker Hub Account & Token

1. **Go to [hub.docker.com](https://hub.docker.com)** and create an account
2. **Generate Access Token:**
   - Click your profile → Account Settings → Security
   - Click "New Access Token"
   - Name: "GitHub Actions"
   - Permissions: Read, Write, Delete
   - **Copy the token** (you won't see it again!)

## Step 2: Add Secrets to GitHub

1. **Go to your GitHub repository**
2. **Click Settings** → **Secrets and variables** → **Actions**
3. **Add these 2 secrets:**

| Secret Name | Value |
|-------------|-------|
| `DOCKER_USERNAME` | Your Docker Hub username |
| `DOCKER_HUB_TOKEN` | The token you copied above |

## Step 3: Push Your Code

```bash
git add .
git commit -m "Add CI/CD pipeline"
git push origin main
```

## Step 4: Watch the Magic! ✨

1. **Go to Actions tab** in your GitHub repository
2. **Watch the workflow run** automatically
3. **See your app deploy** to Docker Hub!

## 🎯 What Happens Next

- ✅ **Every push to main/master** → Builds and deploys to Docker Hub
- ✅ **Pull requests** → Builds and tests (no deployment)
- ✅ **Automatic testing** → Validates your app structure
- ✅ **Docker Hub deployment** → Your app is live!

## 🌐 Using Your Deployed App

Once deployed, anyone can run your app:

```bash
docker pull YOUR_USERNAME/tour-management-app:latest
docker run -d -p 8080:80 --name tour-management YOUR_USERNAME/tour-management-app:latest
```

## 🔍 Monitoring

- **GitHub Actions**: See build status and logs
- **Docker Hub**: View your published images
- **Automatic notifications**: Get notified of deployment status

## 🆘 Need Help?

- Check the **Actions** tab for detailed logs
- Verify your **secrets** are set correctly
- Make sure your **Docker Hub token** has proper permissions

---

**That's it!** Your Tour Management app will now automatically deploy to Docker Hub every time you push changes! 🎉
