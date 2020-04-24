$Bytes = Get-Content -Path .\in.* -Encoding Byte
[System.Convert]::ToBase64String($Bytes) | Set-Content .\out-base64.txt