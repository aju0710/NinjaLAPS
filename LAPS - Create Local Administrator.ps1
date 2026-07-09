# Verify the operating system
if (-not $IsWindows)
{
    Write-Host "Non-Windows device detected."
    Write-Host "This script only supports Windows."
    exit 0
}

# Configuration
$Username = "Efficium"
$Password = ConvertTo-SecureString "Ch@ng3Th1$P@$$w0rd!" -AsPlainText -Force
$FullName = "Efficium"
$Description = "Local administrative account"

# Check if the user already exists
$user = Get-LocalUser -Name $Username -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "Creating local user '$Username'..."

    New-LocalUser `
        -Name $Username `
        -Password $Password `
        -FullName $FullName `
        -Description $Description `
        -PasswordNeverExpires `
        -AccountNeverExpires

    Write-Host "User created."
}
else {
    Write-Host "User '$Username' already exists."
}

# Check if user is already in Administrators group
$IsAdmin = Get-LocalGroupMember -Group "Administrators" -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -match "\\$Username$" }

if (-not $IsAdmin) {
    Write-Host "Adding '$Username' to the Administrators group..."
    Add-LocalGroupMember -Group "Administrators" -Member $Username
    Write-Host "User added to Administrators."
}
else {
    Write-Host "'$Username' is already a member of the Administrators group."
}

Write-Host "Completed."
