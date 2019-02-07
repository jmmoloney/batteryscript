For more detailed implementation details, please see my post here: [http://jmmoloney.github.io/blog/2019/02/02/batteryscript](http://jmmoloney.github.io/blog/2019/02/02/batteryscript)

## bash
Contains the low-battery notification script as a shell script as well as the `.plist` file to run it as an Agent/Daemon. 

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