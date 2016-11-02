FROM microsoft/iis:10.0.14393.206
SHELL ["powershell"]

RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
    Install-WindowsFeature Web-Asp-Net45

COPY HelloDockerOnWindows HelloDockerOnWindows
RUN Remove-WebSite -Name 'Default Web Site'
RUN New-Website -Name 'hellodockeronwindows' -Port 80 \
    -PhysicalPath 'c:\HelloDockerOnWindows' -ApplicationPool '.NET v4.5'

EXPOSE 80

CMD Write-Host IIS Started... ; \ 
    while ($true) { Start-Sleep -Seconds 3600 }
