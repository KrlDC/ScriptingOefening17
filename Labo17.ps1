# 1.1 Schrijf een bericht naar een nieuw logbestand met behulp van Out-File met de boodschap “Dit is het begin van de logfile”. Bestand moet automatisch aangemaakt worden.
"Dit is het begin van de logfile" | Out-File -FilePath "C:\Logs\Oefening1_Log.log"

# 1.2 Maak een herhaling die 5 keer uitgevoerd gaat worden, per keer dat de herhaling uitgevoerd wordt schrijf je het volgende logbericht naar de logfile. “Run: $teller”

# Initialiseer de teller
$teller = 1

# Voer de loop vijf keer uit
while ($teller -le 5) {
    # Schrijf het logbericht naar het logbestand
    Add-Content -Path "C:\Logs\Oefening1_Log.log" -Value "Run: $teller"

    # Verhoog de teller
    $teller++
}


# 2.1 Schrijf een bericht naar de eventlog
Write-EventLog -LogName "Application" -Source "MyScript" -EntryType Information -EventId 1000 -Message "Dit is het begin van de logfile"


# 2.2 Maak een herhaling die 5 keer uitgevoerd gaat worden, per keer dat de herhaling uitgevoerd wordt schrijf je het volgende logbericht naar de logfile. “Run: $teller”
# Initialiseer de teller
$teller = 1

# Voer de loop vijf keer uit
while ($teller -le 5) {
    # Schrijf het logbericht naar het eventlog
    Write-EventLog -LogName "Application" -Source "MyScript" -EntryType Information -EventId 1000 -Message "Run: $teller"

    # Verhoog de teller
    $teller++
}

# 3.1 Neem een kopie van oefening 3.1.2 van Hoofdstuk 15 (Try Catch) en verwerk hierin de Transcript logging. Controleer na het uitvoeren van het script de logfile.
Start-Transcript -Path "C:\Logs\Oefening3_Transcript.txt"

try {
    $bestandspad = Read-Host "Voer het pad van het bestand in:"
    $inhoud = Get-Content $bestandspad
    Write-Host "Inhoud van het bestand:"
    Write-Host $inhoud
}
catch {
    Write-Host "Er is een fout opgetreden bij het openen van het bestand: $_"
}

Stop-Transcript
