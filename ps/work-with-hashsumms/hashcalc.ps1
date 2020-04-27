#Requires -RunAsAdministrator

function MainMenu
{
	Write-Host "Menus:"
	Write-Host "1. Recursive calculate hash summs"
	Write-Host "2. Equals a hash summs"
	Write-Host "Q. Exit"
	Write-Host "Select: " -NoNewLine
	$option = Read-Host


	Switch ($option) 
	{
		1 {CalculateHashSumm}
		2 {EqualsHashSumms}
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

function EqualsHashSumms
{
	Write-Host "Select algorithm (like SHA1,SHA256,SHA384,SHA512,MACTripleDES,MD5,RIPEMD160):"
	$algorithm = Read-Host

	if ($algorithm -ne "SHA1" -and $algorithm -ne "SHA256" -and $algorithm -ne "SHA384" -and $algorithm -ne "SHA512" -and $algorithm -ne "MACTripleDES" -and $algorithm -ne "MD5")
	{
		Write-Host "This algorithm not existed, sorry..."
		Exit
	}
	
	Write-Host "Select the file which you want equal with hash summ:"
	$filePath = Read-Host

	if (-not (Test-Path $filePath))
	{
		Write-Host "Error, this file not existed`n-------------`n"
		Exit
	}

	$fileHashSummObj = Get-ChildItem -Path $filePath | Get-FileHash -Algorithm $algorithm
	$fileHashSumm = $fileHashSummObj.Hash

	$fileHashSummObj | Format-List

	Write-Host "Type a hash summ:"
	$hashSumm = Read-Host

	if ($fileHashSumm -eq $hashSumm)
	{
		Write-Host "`n-------------`nHash summs equals`n-------------`n"
	}
	else
	{
		Write-Host "`n-------------`nHash summs NOT equals`n-------------`n"
	}

	Exit
}

function CalculateHashSumm
{
	Write-Host "Select the folder path where you want to start calculating hash summ:"
	$startPath = Read-Host

	if (-not (Test-Path $startPath))
	{
		Write-Host "Error, this folder not existed...`n-------------`n"
		Exit
	}

	Write-Host "Select algorithm (like SHA1,SHA256,SHA384,SHA512,MACTripleDES,MD5,RIPEMD160):"
	$algorithm = Read-Host

	if ($algorithm -ne "SHA1" -and $algorithm -ne "SHA256" -and $algorithm -ne "SHA384" -and $algorithm -ne "SHA512" -and $algorithm -ne "MACTripleDES" -and $algorithm -ne "MD5")
	{
		Write-Host "This algorithm not existed, sorry"
		Exit
	}

	Get-ChildItem -Path $startPath -Recurse | Get-FileHash -Algorithm $algorithm
	Exit
}

MainMenu