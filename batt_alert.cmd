nircmd.exe win hide ititle "cmd.exe"
powershell -ExecutionPolicy Bypass -File "C:\Scripts\batt_alert.ps1" >> "C:\Scripts\batt_alert.txt" 2>&1