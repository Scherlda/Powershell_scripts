# General variables for paths and filenames
$serviceName = "frxsvc"
$outputDirectory = "C:\sci"
$dateFormat = "yyyyddMM_HHmm"
$date = Get-Date -Format $dateFormat

# Check the status of the service
$serviceStatus = Get-Service $serviceName

if ($serviceStatus.Status -eq 'Running')
{
    # If the service is running, report OK!
    Write-Host "0 ps1_get_${serviceName}_service - $serviceName Service OK"
}
else
{
    # If the service is not running, report NOT OK and create a file with the current date and time
    Write-Host "2 ps1_get_${serviceName}_service - $serviceName Service NOT OK"
    query user >> "$outputDirectory\CrashedUsers_$date.txt"
}
