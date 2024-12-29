$file_data = Import-Csv "C:\dev\powershellWorks\file_hash_check.csv" -Header "Hash", "Path"

$file_count = $file_data.Count

$O_hash = $file_data | Select-Object "Hash"
$O_path = $file_data | select-Object "Path"

$directory = "C:\Users\7flig\Desktop\textFiles"
$all_files = Get-ChildItem -Path $directory -Exclude *.tmp, *.log -Recurse
$all_count = $all_files.Count

if($all_count -ne $file_count){
    $diff = $all_count - $file_count 
    New-BurntToastNotification -Text "File Hash Checks", "$diff File(s) have been included or modified. Verify"
}

#For ($i=0; $i -le $file_count; $i++){
    
 #   $valid = Test-Path -Path $file_data[$i]# | select-object "Path"
#}
#$i = 0
foreach ( $item in $file_data) {
 #Write-Host $item.Path
 $valid = Test-Path -Path $item.Path
 if($valid -ne "True"){
    Write-Output "$item.Path" >> "C:\dev\powershellWorks\file_not_hash.txt"  
 }
 try{
    $file_hash = (Get-FileHash -Algorithm SHA1 -Path $item.Path).Hash #| Select-Object Hash
 } catch {
    Write-Output "Error processing $($item.Path): $($_.Exception.Message)" >> "C:\dev\powershellWorks\errors.log"
    continue
 }
 #Write-Host $file_hash
 $hash_value = $item.Hash 
 #Write-Host $hash_value
 if($file_hash -ne $hash_value){
    Write-Output "Anomaly $($item)" >> "C:\dev\powershellWorks\file_not_hash.txt" 
 }
 #$i = $i + 1 
}