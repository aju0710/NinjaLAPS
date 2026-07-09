##DICTIONARY_DOWNLOAD_SCRIPT
# Verify the operating system
if (-not ($PSVersionTable.Platform -eq "Win32NT" -or $env:OS -eq "Windows_NT"))
{
    Write-Host "Non-Windows device detected."
    Write-Host "This script only supports Windows."
    exit 0
}

$DictionaryFolder = "C:\NinjaLAPS"
$DictionaryFile   = "$DictionaryFolder\dict.csv"
$DictionaryUrl    = "https://cdn.jsdelivr.net/gh/aju0710/NinjaLAPS@main/dict.csv"

Write-Host "Checking local dictionary..."

# Skip download if dictionary already exists
if (Test-Path $DictionaryFile)
{
    Write-Host "Dictionary already exists."
    Write-Host "Skipping download."
    return
}

Write-Host "Dictionary not found."
Write-Host "Creating local folder..."

try
{
    if (!(Test-Path $DictionaryFolder))
    {
        New-Item -Path $DictionaryFolder -ItemType Directory -Force -ErrorAction Stop | Out-Null
    }
}
catch
{
    Write-Host "Failed to create folder."
    Write-Host $_.Exception.Message
    exit 1
}

Write-Host "Downloading dictionary..."

try
{
    Invoke-WebRequest `
        -Uri $DictionaryUrl `
        -OutFile $DictionaryFile `
        -UseBasicParsing `
        -ErrorAction Stop

    Write-Host "Dictionary downloaded successfully."
}
catch
{
    Write-Host "Dictionary download failed."
    Write-Host $_.Exception.Message
    exit 1
}

Write-Host "Script completed successfully."
