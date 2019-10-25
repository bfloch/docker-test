# Container image that runs your code
# The windows version has to match the host system.
# 1809 ->	10.0.17763.805 -> windows-2019
# Compare: https://hub.docker.com/_/microsoft-windows-servercore
FROM mcr.microsoft.com/windows/servercore:1809-amd64

SHELL ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "ByPass"]

COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "ByPass", "-File", "/entrypoint.ps1"]
