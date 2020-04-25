$response = Invoke-WebRequest -UseBasicParsing -Uri https://api.ipify.org -Method Get -ContentType text
$response