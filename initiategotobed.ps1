$O = New-ScheduledJobOption -WakeToRun -MultipleInstancePolicy Queue
$T = New-JobTrigger -Daily -At "23:20"
$path = "C:\dev\powershellWorks\gotobed.ps1"
Register-ScheduledJob -Name "TellMeToSleep" -FilePath $path -ScheduledJobOption $O -Trigger $T