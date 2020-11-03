#****************************************************************************
# Name: battalert.vbs                                                       *
# Author: Pranav Srivatsav Concheepuram                                     *
# Description: powershell script to provide alerts on high and low battery  *
#****************************************************************************

while(1)
{
    $x= (Get-WmiObject win32_battery).estimatedChargeRemaining
    $y= (Get-WmiObject win32_battery).BatteryStatus
    if($x -le 20 -AND $y -eq 1){
        [reflection.assembly]::loadwithpartialname("System.Windows.Forms")
        [reflection.assembly]::loadwithpartialname("System.Drawing")
        $notify = new-object system.windows.forms.notifyicon
        $notify.icon = [System.Drawing.SystemIcons]::Information
        $notify.visible = $true
        $notify.showballoontip(15,"Battery Low! - $($x)%","Connect the charger",[system.windows.forms.tooltipicon]::None)
        start-sleep -seconds 15
        $notify.Dispose()
    }elseif ($x -gt 85 -AND $y -eq 2){
        [reflection.assembly]::loadwithpartialname("System.Windows.Forms")
        [reflection.assembly]::loadwithpartialname("System.Drawing")
        $notify = new-object system.windows.forms.notifyicon
        $notify.icon = [System.Drawing.SystemIcons]::Information
        $notify.visible = $true
        $notify.showballoontip(15,"Battery High! - $($x)%","Disconnect the charger",[system.windows.forms.tooltipicon]::None)
        start-sleep -seconds 15
        $notify.Dispose()
    }
    start-sleep -seconds 180
}