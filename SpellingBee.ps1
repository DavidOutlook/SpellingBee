# Kanban Board created in GitKraken
Write-Host "I or we are going to make flashcards to help my son learn spelling words"

# Step 1 - Import Data



# https://adamtheautomator.com/read-host/
# prompt user for string value = read-host
# powershell prompt user for input


$word = Read-Host -prompt 'Spell'
if ($word) {
    input -eq true | Write-Host 'Correct!'
} elseif (-eq false) {
    Write-Host 'Try again'
}

#LOOP BACK if incorrect, 
do {
    
} until (-eq true)