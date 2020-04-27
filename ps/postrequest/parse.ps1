Write-Host "Type HTTP address: " -NoNewLine
[string] $target = Read-Host

Write-Host "Verbose: " -NoNewLine
[string] $verb = Read-Host

if ($verb -ne "GET" -and $verb -ne "POST")
{
	Write-Host "Bad verbose"
}

[string] $content = ""


$webRequest = [System.Net.WebRequest]::Create($target)
$encodedContent = [System.Text.Encoding]::UTF8.GetBytes($content)
$webRequest.Method = $verb
  
Write-Host "UTF8 Encoded HTTP Content: $content"
if ($encodedContent.length -gt 0) 
{
    $webRequest.ContentLength = $encodedContent.length
    $requestStream = $webRequest.GetRequestStream()
    $requestStream.Write($encodedContent, 0, $encodedContent.length)
    $requestStream.Close()
}
  
[System.Net.WebResponse] $response = $webRequest.GetResponse();

if ($response -ne $null) 
{
    $respStream = $response.GetResponseStream();
    [System.IO.StreamReader] $respStream = New-Object System.IO.StreamReader -argumentList $respStream;
    [string] $results = $respStream.ReadToEnd();
  
    return $results
}
else
{
    exit 1
}