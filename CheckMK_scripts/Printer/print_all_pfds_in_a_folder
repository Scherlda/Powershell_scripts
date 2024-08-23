# This script automatically prints all PDF files in a specified folder to a specified network printer.

# General variables for the printer server, printer name, and PDF folder path
$printerServer = "\\printserver"
$printerName = "myCutePrinter"
$pdfFolder = "C:\opt\test"

# Combine printer server and printer name to form the full printer path
$fullPrinterPath = "$printerServer\$printerName"

# Get all PDF files in the specified folder
$allPdf = Get-ChildItem -Path $pdfFolder -Filter *.pdf 

# Loop through each PDF file and send it to the printer
foreach ($pdf in $allPdf)
{
    Print /d:"$printerName" "$fullPrinterPath"
}
