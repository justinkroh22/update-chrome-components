<#
Author: Justin Kroh
Date: 2/14/2020

About: This is a macro-like script that updates chrome and its components, loosley based off of a post I found on reddit

Credits: https://www.reddit.com/r/PowerShell/comments/b0mv9d/updating_google_chrome_through_powershellpowercli/
This Script Impoves upon a previous script to fix a few bugs and add component updating

Instructions:

1. Configure the variables below to match the specifics of your organizations chrome application

2. Run the Script


WARNING: DO NOT USE YOUR COMPUTER WHILE THE SCRIPT IS RUNNING


#>



$chrome_update_time = 10 #this value sets how long the script should wait (in seconds) for chrome to download and install the latest update
$number_of_components = 15 #set this value for the number of components chrome has. (chrome://components)
$chrome_relaunch_buffer_time = 10 #this value sets the time for chrome to relaunch after closing
$component_update_speed = .8 # How fast keystrokes are sent to go through components and update them. (.5 = Instant)


start chrome #This launches chrome

Sleep 1 #buffer time

$wshell = New-Object -ComObject wscript.shell; # This allows us to send keystrokes

$wshell.AppActivate('Chrome') #This prevents the macro like script from send key strokes something outside of chrome by making it the active window

Sleep 1

$wshell.SendKeys("^{t}") #Opens new tab, Important, do not remove

Sleep 1

$wshell.SendKeys('chrome://settings/help') #This brings us to a page where updates are initated

Sleep .5

$wshell.SendKeys("{ENTER}")

Sleep $chrome_update_time #Time it takes for chrome to update


$wshell.SendKeys("%{F4}") # closes chrome

Sleep $chrome_relaunch_buffer_time



start chrome #starts chrome again to update components

Sleep 1

$wshell.AppActivate('Chrome') #This prevents the macro like script from send key strokes something outside of chrome by making it the active window

Sleep 1

$wshell.SendKeys("^{t}") #new tab, important do not delete

Sleep 1

$wshell.SendKeys('chrome://components') #components page

Sleep .5

$wshell.SendKeys("{ENTER}")

Sleep .5



$wshell.SendKeys("{TAB}") #Initial Tab
Sleep 3

    
#Update Loop for components
For ($i=0; $i -le $number_of_components - 1; $i++) {
    
    $wshell.SendKeys("{TAB}")
    Sleep $component_update_speed
    $wshell.SendKeys("{ENTER}")
    Sleep $component_update_speed

    }

#Sleep 5 #Buffer for components to finish upgrading     

$wshell.SendKeys("%{F4}") #exits chrome

