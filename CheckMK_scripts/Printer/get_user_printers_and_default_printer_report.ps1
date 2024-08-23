# This script helps administrators identify which user is connected to which printer 
# and which printer is set as the default printer. The script generates a report 
# and saves it to a specified file.

# General variables for paths and filenames
$outfile = 'P:\printers\User_Printer_Report_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt'

# Query all network printers and write the share names to the output file
Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Network=true" | 
    Select-Object 'ShareName' | 
    ForEach-Object { $_.Sharename.Trim() } | 
    Out-File $outfile

# Append the standard (default) printer information to the output file
Write-Host "Default Printer" >> $outfile
Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Default=true" | 
    Select-Object 'ShareName' | 
    ForEach-Object { $_.Sharename.Trim() } >> $outfile
