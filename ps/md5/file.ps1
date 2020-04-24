Get-FileHash .\in.* -Algorithm MD5 | Select-Object -Property Algorithm, Hash
Get-FileHash .\in.* -Algorithm SHA256 | Select-Object -Property Algorithm, Hash