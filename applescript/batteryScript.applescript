set Cap to (do shell script "ioreg -b -w 0 -f -r -c AppleSmartBattery | grep ExternalConnected")
tell Cap to set {wallPower} to {last word of paragraph 1}
if wallPower = "Yes" then
	return 0
else
	set Pct to (do shell script "pmset -g batt | grep -Eo \"\\d+%\" | cut -d% -f1") as number
	if Pct > 10 and Pct 20 then
		display notification "Less than 20% Battery Remaining, plug in soon." with title "Low Battery" sound name "Basso"
	else if Pct 10 then
		display notification "Less than 10% Battery, plug in now." with title "Critical Battery" sound name "Sosumi"
	end if
end if
