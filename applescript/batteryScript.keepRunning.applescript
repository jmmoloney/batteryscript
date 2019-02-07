
set Cap to (do shell script "ioreg -w0 -l | grep ExternalChargeCapable")
tell Cap to set {wallPower} to {last word of paragraph 1}
if wallPower = "Yes" then
	return 0
else
	set Pct to (do shell script "pmset -g batt | grep -Eo \"\\d+%\" | cut -d% -f1")
	if Pct > 10 and Pct ² 20 then
		display notification "Less than 20% Battery Remaining, plug in soon." with title "Low Battery" sound name "Basso"
		delay 600
	else if Pct ² 10 then
		display notification "Less than 10% Battery, plug in now." with title "Critical Battery" sound name "Sosumi"
		delay 300
	end if
end if
