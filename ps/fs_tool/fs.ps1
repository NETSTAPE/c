function MainMenu
{
	Write-Host "Menus:"
	Write-Host "1. Move"
	Write-Host "2. Copy"
	Write-Host "3. Remove"
	Write-Host "4. Write"
	Write-Host "5. Append"
	Write-Host "Q. Exit"
	Write-Host "Select: " -NoNewLine
	$option = Read-Host


	Switch ($option)
	{
		1 {_Move}
		2 {_Copy}
		3 {_Remove}
		4 {_Write}
		5 {_Append}
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

function _Append
{
	Write-Host "Type path: "
	$filePath = Read-Host

	if (-not (Test-Path $filePath))
	{
		Write-Host "Error, this path not existed`n-------------`n"
		Exit
	}

	Write-Host "Type encoding (like Unknown, String, Unicode, Byte, BigEndianUnicode, UTF8, UTF7, UTF32, Ascii, Default, Oem, BigEndianUTF32): "
	$encoding = Read-Host
	$encoding = $encoding.ToLower()

	if ($encoding -ne "unknown" -and $encoding -ne "string" -and $encoding -ne "unicode" -and $encoding -ne "bigendianunicode" -and $encoding -ne "utf8" -and $encoding -ne "utf7" -and $encoding -ne "utf32" -and $encoding -ne "ascii" -and $encoding -ne "default" -and $encoding -ne "oem")
	{
		Write-Host "Error, this encoding not exists"
		Exit
	}

	Write-Host "Type content: "
	$content = Read-Host

	$content | Out-File -FilePath $filePath -Encoding $encoding -Append
	Write-Host "Appended"
}

function _Write
{
	Write-Host "Type path: "
	$filePath = Read-Host

	Write-Host "Type encoding (like Unknown, String, Unicode, Byte, BigEndianUnicode, UTF8, UTF7, UTF32, Ascii, Default, Oem, BigEndianUTF32): "
	$encoding = Read-Host
	$encoding = $encoding.ToLower()

	if ($encoding -ne "unknown" -and $encoding -ne "string" -and $encoding -ne "unicode" -and $encoding -ne "byte" -and $encoding -ne "bigendianunicode" -and $encoding -ne "utf8" -and $encoding -ne "utf7" -and $encoding -ne "utf32" -and $encoding -ne "ascii" -and $encoding -ne "default" -and $encoding -ne "oem" -and $encoding -ne "bigendianutf32")
	{
		Write-Host "Error, this encoding not exists"
		Exit
	}

	Write-Host "Type content: "
	$content = Read-Host

	Set-Content -Path $filePath -Encoding $encoding -Value $content
	Write-Host "Wrote"

	Exit
}

function _Move
{
	Write-Host "Type path: "
	$filePath = Read-Host

	if (-not (Test-Path $filePath))
	{
		Write-Host "Error, this path not existed`n-------------`n"
		Exit		
	}

	Write-Host "Type file destination: "
	$destPath = Read-Host

	if (-not (Test-Path $destPath))
	{
		Write-Host "Error, this path not existed`n-------------`n"
		Exit
	}

	Move-Item -Path $filePath -Destination $destPath -Force
	Write-Host "Moved"
}

function _Copy
{
	Write-Host "Type path: "
	$filePath = Read-Host

	if (-not (Test-Path $filePath))
	{
		Write-Host "Error, this not existed`n-------------`n"
		Exit		
	}

	Write-Host "Type destination path: "
	$destPath = Read-Host

	if (-not (Test-Path $destPath))
	{
		Write-Host "Error, this path not existed`n-------------`n"
		Exit
	}

	Copy-Item -Path $filePath -Destination $destPath -Force
	Write-Host "Copied"

	Exit
}

function _Remove
{
	Write-Host "Type path: "
	$filePath = Read-Host

	if (-not (Test-Path $filePath))
	{
		Write-Host "Error, this path not existed`n-------------`n"
		Exit		
	}

	Remove-Item -Path $filePath -Force
	Write-Host "Removed"

	Exit
}

MainMenu