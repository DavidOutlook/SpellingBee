#Extract content of Microsoft Word Document to text
$word = New-Object -comobject Word.Application
$word.Visible = $true 
$doc = $word.Documents.Open("D:\Deleteme\test2.docx") 
$sel = $word.Selection
$paras = $doc.Paragraphs

$path = "D:\deleteme\words.txt"

foreach ($para in $paras) 
{ 
    $para.Range.Text | Out-File -FilePath $path 
}

#Find all capitolized words :( Everything works except this. I want to extract all Capitolized words
$capwords = Get-Content  $path |
  Select-String -CaseSensitive -AllMatches -Pattern '\b[A-Z][a-z]+\b' |
    ForEach-Object { $_.Matches.Value }