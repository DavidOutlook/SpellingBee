# Kanban Board created in GitKraken

# Load function "new-speech" for audible

new-speech -text "Hello, what is your name?" 
new-speech -notext "Hello, what is your name?" 

$name = Read-Host "Hello, what is your name?" 


new-speech -text $name = Read-Host "Hello, what is your name?"


Write-Output "Nice to meet you $name, let's spell some words together!"

# Load spelling words from text file
$words = get-content 'SampleWords.txt'
new-speech 
foreach ($word in $words) {
    Read-host -Prompt 
}

new-speech -text "This is a test"


$word = Read-Host -prompt 'Spell'
if ($word) {
    input -eq true | Write-Host 'Correct!'
} elseif (-eq false) {
    Write-Host 'Try again'
}

#LOOP BACK if incorrect, 
do {
    
} until (-eq true)