# Custom 'Low Battery' Notification on MacOS

For more detailed implementation details, please see my post here: [http://jmmoloney.github.io/blog/2019/02/02/batteryscript](http://jmmoloney.github.io/blog/2019/02/02/batteryscript)

## Important Folders in this repository

* applescript
* bash

## applescript
Contains the low-battery notification script in both script (`.scpt`) format as well as text format (`.applescript`). Also additional scripts to work with the `KeepAlive` option specified in the corresponding `.plist` file.

* `batteryScript.scpt`
	- Compiled version of the battery script written in `batteryScript.applescript`
	- Meant to be used in conjunction with `batteryAlert.plist`
* `batteryScript.applescript`
	- Text version of the `batteryScript.scpt`, easily editable
	- After compiling, to be used with `batteryAlert.plist`
* `batteryAlert.plist`
	- Property list file used to run the scheduled process `batteryScript.scpt`
	- Set to run the script every 10 minutes to check battery levels
	- Is not set to run continuously in the background
* `batteryScript.keepRunning.scpt`
	- Compiled version of the battery script written in `batteryScript.keepRunning.applescript`
	- Meant to be used in conjunction with `batteryAlert.keepRunning.plist`
* `batteryScript.keepRunning.applescript`
	- Text version if the `batteryScript.keepRunning.scpt`
	- Once compiled, is to be used with `batteryAlert.keepRunning.plist`
* `batteryAlert.keepRunning.plist`
	- Is set to run continuously in the background
	- If used correctly with `batteryScript.keepRunning.scpt` will give notifications for a battery level between 10% and 20% every 10 minutes and will give notifications for a battery level lower than 10% every 5 minutes


## bash
Contains the low-battery notification script as a shell script as well as the `.plist` file to run it as an Agent/Daemon. This version continuously runs in the background and will send a notification every 10 minutes if the battery percentage is between 10 and 20 percent and a notification every 5 minutes when battery levels are below 10 percent.

* `batteryScript.keepRunning.sh`
	- This version continuously runs in the background and will send a notification every 10 minutes if the battery percentage is between 10 and 20 percent and a notification every 5 minutes when battery levels are below 10 percent.

* `batteryAlert.keepRunning.plist`
	- To be used with the above shell script in order to run the process continuously in the background

#### Notes

Don't forget to make the `.sh` file executable once in your directory with the following command in the terminal `chmod +x /path/batteryScript.keepAlive.sh`.

If you would like a version that does not run continuously in the background, remove the `sleep` lines from the shell script and change the following in the `plist` file:

* change the value of `KeepAlive` to `false`
* add the following `StartInterval` to the end of your dictionary

```applescript
     <key>StartInterval</key>
     <integer>600</integer>
```