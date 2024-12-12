
$PasswordPath = "C:\...\yahoo_password.txt"
#Test-Path $PasswordPath
$Username = "first_email_address@yahoo.com" # Your Yahoo email address

# Load and decrypt the password
$SecurePassword = Get-Content -Path $PasswordPath | ConvertTo-SecureString
$Credential = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)


Send-MailMessage -From 'firstemailusernamehere <first_email_address.com>' -To 'secondemailusernamehere <second_email_address.com>' -Subject "Test2 smtp with Powershell" -Credential  $Credential -UseSsl -SmtpServer "smtp.mail.yahoo.com" -Port 587 -Body "This is the second test" -Attachments "C:\...\AssemblyNotes.md"