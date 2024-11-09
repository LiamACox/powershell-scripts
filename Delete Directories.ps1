<#
	Path of target directory with trailing backslash.
	For example: 
	'C:\path\to\dir\'
#>
$path = 'C:\path\to\dir\'

<# 
	Fill reservedDirs with all of the directories you would
	like to preserve
	
	For example:
	$reservedDirs = @('toPreserve0', 'toPreserve1', 'toPreserve2', ... , 'toPreserveN')
#>
$reservedDirs = @('toPreserve0', 'toPreserve1')	
$toDelete = (Get-ChildItem $path -Directory).Name

Write-Host 'Directories Found:'
foreach ($directory in $toDelete) {
	if (!($reservedDirs -contains $directory)) {
		Write-Host $directory
	}
}

$confirm = Read-Host -Prompt 'Confirm? (Y\N)'
while (($confirm -ne 'Y') -and ($confirm -ne 'N')) {
	$confirm = Read-Host -Prompt 'Confirm? (Y\N)'
}	

if ($confirm -eq 'N') {
	Write-Host 'Cancelling'
} else {
	foreach ($directory in $toDelete) {
		if (!($reservedDirs -contains $directory)) {
			Write-Host "Deleting" $directory 
			Remove-Item -Path ($path + $directory) -Recurse -Force
		}
	}
}

pause