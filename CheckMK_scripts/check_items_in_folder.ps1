###################################################
# Check MK Script - check if files left in folder #
###################################################
# Made by: Damian Scherl                          #
# Made at: 27.12.2021                             #
###################################################
#            Time Trigger via Check MK            #
# The Scripts retuns if there is a File in the    #
# mypath variable Path (Folder)                   #
###################################################
# Last change by: Damian Scherl                   #
# Last change at: 10.01.2022                      #
###################################################

# User editable variables
$mypath = 'C:\EEAttachments'
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

