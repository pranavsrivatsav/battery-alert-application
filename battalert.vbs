'********************************************************************
' Name: battalert.vbs                                               *
' Author: Pranav Srivatsav Concheepuram                             *
' Description: vb script to provide alerts on high and low battery  *
'********************************************************************

dim x
While True
	On Error Resume Next
	'x = interval between battery checks (in milliseconds)
	x=60000
	strComputer = "."
	'getting windows battery object
	Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
	Set colItems = objWMIService.ExecQuery("Select * from Win32_Battery",,48)
	For Each objItem in colItems
		'if battery is charging and battery% remaining > {provided}
		if objItem.BatteryStatus=2 And objItem.EstimatedChargeRemaining>84 then	
			CreateObject("WScript.shell").Popup "DISCONNECT the charger [ Battery - "&objItem.EstimatedChargeRemaining&"% ]", 10, "Battery High!", 4096
			'Wscript.Echo "BatteryStatus: " & objItem.BatteryStatus
			x=180000
			
		'if battery is discharging and battery% remaining < {provided}
		elseif objItem.BatteryStatus=1 And objItem.EstimatedChargeRemaining<20 then
			CreateObject("WScript.shell").Popup "CONNECT the charger [ Battery - "&objItem.EstimatedChargeRemaining&"% ]", 10, "Battery Low!", 4096
			'Wscript.Echo "BatteryStatus: " & objItem.BatteryStatus
			x=180000
		end if
		
		
	Next
	Wscript.Sleep x

Wend