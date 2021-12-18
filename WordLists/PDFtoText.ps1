# PDF is complex, try to get to Import-CSV or .txt file for Get-Content
# search pdf text extractor; lots of options online   
https://pdftotext.com/ worked well
then use Get-Content to read text and store into an array

----------------------------------------------------------------


# Parse PDF file for word list, I'm guessing will put into an array later
# https://stackoverflow.com/questions/18313506/parsing-pdf-by-line

$reader = New-Object iTextSharp.text.pdf.pdfreader  -ArgumentList "oldy.pdf"

for ($page = 1; $page -le $reader.NumberOfPages; $page++)
{
    $strategy = new-object  'iTextSharp.text.pdf.parser.SimpleTextExtractionStrategy'            
    $currentText = [iTextSharp.text.pdf.parser.PdfTextExtractor]::GetTextFromPage($reader, $page, $strategy);
    [string[]]$Text += [system.text.Encoding]::UTF8.GetString([System.Text.ASCIIEncoding]::Convert( [system.text.encoding]::default, [system.text.encoding]::UTF8, [system.text.Encoding]::Default.GetBytes($currentText)));
}

# Search pdf text extractor powershell = https://stackoverflow.com/questions/15684699/how-to-parse-pdf-content-to-database-with-powershell

Add-Type -Path .\itextsharp.dll
$reader = New-Object iTextSharp.text.pdf.pdfreader -ArgumentList c:\ps\a.pdf        

for ($page = 1; $page -le $reader.NumberOfPages; $page++)
{
    $strategy = new-object  'iTextSharp.text.pdf.parser.SimpleTextExtractionStrategy'            
    $currentText = [iTextSharp.text.pdf.parser.PdfTextExtractor]::GetTextFromPage($reader, $page, $strategy);
    [string[]]$Text += [system.text.Encoding]::UTF8.GetString([System.Text.ASCIIEncoding]::Convert( [system.text.encoding]::default  , [system.text.encoding]::UTF8, [system.text.Encoding]::Default.GetBytes($currentText)));      
}
$Reader.Close();

# ALSO from same website above https://stackoverflow.com/questions/18313506/parsing-pdf-by-line
# Download http://sourceforge.net/projects/itextsharp/

Add-Type -Path itextsharp.dll

$reader = New-Object iTextSharp.text.pdf.pdfreader -ArgumentList MyFile.pdf

for ($page = 1; $page -le $reader.NumberOfPages; $page++)
{
  # extract a page and split it into lines
  $text = [iTextSharp.text.pdf.parser.PdfTextExtractor]::GetTextFromPage($reader,$page).Split([char]0x000A)

  Write-Host "Page $($page) contains $($text.Length) lines. This is line 5:"
  Write-Host $text[4]

  #foreach ($line in $text)
  #{
  #  any tasks
  #}
}

$reader.Close()