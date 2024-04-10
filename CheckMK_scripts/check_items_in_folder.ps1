# User editable variables
$mypath = 'C:\mypath\here\'
$filetype = '*.pdf'
$timeInMinutesToGoBack = 30

#Calculatet variables
#Date - USer Definiet Minutes
$filedate = (Get-Date).AddMinutes(-$timeInMinutesToGoBack)
$fileItemCount = (Get-ChildItem -Path $mypath $filetype | Where-Object {$_.LastWriteTime -lt $filedate}).Count

#return to checkmk
#If the File count is greater than (-gt), check is not OK, else check is OK
if($fileItemCount -gt 0)
{
    Write-Host "2 check_items_in_folder - PDFs left => NICHT OK"
}
else
{
    Write-Host "0 check_items_in_folder - No PDFs left => OK"
}

