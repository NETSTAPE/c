function MainMenu
{
	Write-Host "Menus:"
	Write-Host "1. Encode file"
	Write-Host "2. Encode string"
	Write-Host "-----------------"
	Write-Host "3. Decode file"
	Write-Host "4. Decode string"
	Write-Host "Q. Exit"
	Write-Host "Select: " -NoNewLine
	$option = Read-Host


	Switch ($option) 
	{
		1 {encodeFile}
		2 {encodeString}
		3 {decodeFile}
		4 {decodeString}
		Q 
		{
			Write-Host "Bay!"
			Exit
		}
		Default
		{
			"Unknown option`n-------------`n"
			MainMenu
		}
	}
}


function encodeFile
{
	Write-Host "Type path: " -NoNewLine
	$path = Read-Host
	
	if (-not (Test-Path $path))
	{
		Write-Host "Path or file not exists"
	}
	
	Write-Host "Type out path: " -NoNewLine
	$out_path = Read-Host

	$bytes = Get-Content -Path $path -Encoding Byte
	[System.Convert]::ToBase64String($bytes) | Set-Content $out_path -Encoding Unicode
	
	Write-Host "Finished!"
}


function decodeFile
{
	Write-Host "Type path: " -NoNewLine
	$path = Read-Host
	
	if (-not (Test-Path $path))
	{
		Write-Host "Path or file not exists"
		Exit
	}
	
	Write-Host "Type out path: " -NoNewLine
	$out_path = Read-Host
	$enc = [System.Text.Encoding]::Unicode
	
	$bytes = Get-Content -Path $path -Encoding Unicode
	$enc.GetString([System.Convert]::FromBase64String($bytes)) | Set-Content $out_path -Encoding Unicode
	
	Write-Host "Finished!"
}


function encodeString
{
	Write-Host "Type string: " -NoNewLine
	$text = Read-Host
	$enc = [System.Text.Encoding]::Unicode

	[System.Convert]::ToBase64String($enc.GetBytes($text))
	
	Write-Host "Finished!"
}


function decodeString
{
	Write-Host "Type string: " -NoNewLine
	$text = Read-Host
	$enc = [System.Text.Encoding]::Unicode

	$enc.GetString([System.Convert]::FromBase64String($text))
	
	Write-Host "Finished!"
}

MainMenu