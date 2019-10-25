# Container image that runs your code
# The windows version has to match the host system.
# 1809 ->	10.0.17763.805 -> windows-2019
# Compare: https://hub.docker.com/_/microsoft-windows-servercore
FROM mcr.microsoft.com/windows/servercore:1809-amd64

SHELL ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "ByPass"]

# ------------------------------------------------------------------------------------------------------------
# Chocolatey
#
ENV chocolateyUseWindowsCompression false
RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco feature disable --name showDownloadProgress

# ------------------------------------------------------------------------------------------------------------
# Git
#
RUN choco install git.install --yes --version=2.23.0

# ------------------------------------------------------------------------------------------------------------
# Cmake
#
RUN choco install cmake --version=3.15.4

# ------------------------------------------------------------------------------------------------------------
# pwsh (PowerShellCore)
#
choco install pwsh --version=6.2.2

# ------------------------------------------------------------------------------------------------------------
# python (Argument)
#
ARG python
choco install python --version=$python

COPY entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "ByPass", "-File", "/entrypoint.ps1"]
