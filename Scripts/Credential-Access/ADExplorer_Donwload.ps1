 # Define the URL and local path
$url = "https://live.sysinternals.com/ADExplorer64.exe"
$destination = "C:\Tools\ADExplorer64.exe" # Change the destination as needed

# Create the destination directory if it doesn't exist
if (-not (Test-Path -Path (Split-Path -Path $destination -Parent))) {
    New-Item -ItemType Directory -Path (Split-Path -Path $destination -Parent)
}

# Download ADExplorer64.exe
Invoke-WebRequest -Uri $url -OutFile $destination

# Check if the file was downloaded successfully
if (Test-Path -Path $destination) {
    Write-Host "ADExplorer64.exe downloaded successfully to $destination"
} else {
    Write-Host "Failed to download ADExplorer64.exe"
} 
