#LAPS_Rotate_Local_Password_Script
### Configuration
$Username = "Efficium"
$Path = "C:\NinjaLAPS\dict.csv"

# Verify dictionary exists
if (!(Test-Path $Path))
{
    Write-Host "Dictionary file not found: $Path"
    exit 1
}

$rand = New-Object System.Random

$conjunction = @("THE","MY","WE","OUR","AND","BUT","PLUS")
$conjunction2 = @("need","your","mine","their","or","if","also")

$words = Import-Csv $Path

$word1 = ($words[$rand.Next(0,$words.Count)]).Word
$con = $conjunction[$rand.Next(0,$conjunction.Count)]
$word2 = ($words[$rand.Next(0,$words.Count)]).Word
$con2 = $conjunction2[$rand.Next(0,$conjunction2.Count)]
$word3 = ($words[$rand.Next(0,$words.Count)]).Word

$NewPW = "$word1-$con-$word2-$con2-$word3"

Write-Host "Generated Password:"
Write-Host $NewPW

try
{
    net user $Username $NewPW

    if ($LASTEXITCODE -eq 0)
    {
        Write-Host "Password updated successfully for $Username"

        Ninja-Property-Set localpass $NewPW

        Write-Host "Custom field 'localpass' updated successfully."
    }
    else
    {
        Write-Host "Password update failed."
        exit 1
    }
}
catch
{
    Write-Host $_.Exception.Message
    exit 1
}

Write-Host "LAPS rotation completed successfully."
