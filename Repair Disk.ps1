$target = 'C'
# Runs repair-volume and scans for issues on the drive $target
$result = Repair-Volume -DriveLetter $target -Scan
if ($result -ne 'NoErrorsFound') {
	Write-Host Issues found on $target
	
	Write-Host Would you like to bring the drives offline to attempt a fix?
	
	$confirm = Read-Host -Prompt 'Confirm? (Y\N)'
	
	while (($confirm -ne 'Y') -and ($confirm -ne 'N')) {
		$confirm = Read-Host -Prompt 'Confirm? (Y\N)'
	}	
	if ($confirm -eq 'Y') {
		Repair-Volume -DriveLetter $target -OfflineScanAndFix 
	} else {
		Write-Host Exiting...
	}

} else {
	Write-Host No issues found, exiting...
}

pause