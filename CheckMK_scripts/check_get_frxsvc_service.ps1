$serviceStatus = Get-Service frxsvc
$date = Get-Date -Format "yyyyddMM_HHmm"
if ($serviceStatus.Status -eq 'Running')
{
# If Service is Running, tactus Service = OK!
    Write-Host "0 ps1_get_frxsvc_service - FsLogix Dienst OK"
}
else
{
# If Service is not Running. Report sms via Tactus. Create File with, Users in Filename YearMonthDay_HourMinutes
    Write-Host "2 ps1_get_frxsvc_service - FsLogix Dienst NICHT OK"
    query user >> c:\sci\CrashedUsers_$date.txt
}