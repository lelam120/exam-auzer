@echo off
setlocal

set APP_NAME=le-ba-ha-lam
set RESOURCE_GROUP=le-ba-ha-lam-rg
set LOCATION=eastus

echo Tạo Resource Group
az group create --name %RESOURCE_GROUP% --location %LOCATION%

echo Tạo App Service Plan
az appservice plan create --name %APP_NAME%-plan --resource-group %RESOURCE_GROUP% --sku B1 --is-linux

echo Tạo Web App
az webapp create --resource-group %RESOURCE_GROUP% --plan %APP_NAME%-plan --name %APP_NAME% --runtime "DOTNETCORE:8.0" --deployment-local-git

echo Lấy URL Git
az webapp deployment source config-local-git --name %APP_NAME% --resource-group %RESOURCE_GROUP%

echo Đã hoàn tất. Push source code lên repo git trên để triển khai.

endlocal
pause
