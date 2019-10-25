# Container image that runs your code
FROM mcr.microsoft.com/windows/servercore:1903-amd64

SHELL ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "ByPass"]

COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "ByPass", "-File", "/entrypoint.sh"]
