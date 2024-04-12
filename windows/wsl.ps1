# New List
$newList = @()

# Initialize a counter for line numbers
$lineNumber = 0

Write-Host @"
`n
******************************************
List of Distribution Available in WSL
******************************************
`n
"@

# Capture the WSL list output, skipping the first 6 lines
$filteredWslList1 = wsl --list --online | Select-Object -Skip 6 | ForEach-Object {
  if ($_ -ne "") {
    if ($_ -match "^\S.*\S$") {
      # Add line number
      if ($lineNumber -gt 0) { 
        $newList += "$lineNumber. $_ `n"
      }
      else {
        # Add the header line
        $newList += "$_ `n"
      }
      $lineNumber++
    }
  }
}
$lineNumber--

# Enter Line Number to Install
try {
  $userInput = Read-Host "$newList `n Enter Number from 1 - $lineNumber "

  switch ((0 -lt $userInput) -and ($userInput -le $lineNumber)) {
    $true {
      # Valid input range
      # Do something with the valid user input (e.g., display selected WSL entry)
      $selected = $($newList[$userInput -as [int]])
      $choice = Read-Host "Do you wish to install? $($selected.Split("   ")[1]) (Y/N)"
      switch ($choice) {
        Y { Write-Host "wsl --install -d $($selected.Split("   ")[1])" }
        N { Write-Host "Exit..." }
        default { Write-Host "Invalid selection. Exit..." }
      }
    }
    $false {
      # Invalid input range
      Write-Host "Invalid selection. Exit..."
    }
  }
}
catch {
  # Handle the conversion error
  Write-Host "Invalid selection. Exit..."
}