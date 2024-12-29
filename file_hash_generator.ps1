$directory = "C:\Users\7flig\Desktop\textFiles" #"C:\Windows\System32" 

$all_files = get-childitem -Path $directory -Exclude *.tmp, *.log -Recurse
 
 ForEach ($file In $all_files) {
    
        $file_hash = Get-FileHash -Algorithm SHA1 -Path $file | Select-Object Hash, Path
        #$file_hash.Hash
        Write-Output "$($file_hash.Hash), $($file_hash.Path)" >> "C:\dev\powershellWorks\file_hash_check.csv" 
    
}

