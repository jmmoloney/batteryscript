#!/bin/sh
wallPower=$(ioreg -w0 -l | grep ExternalChargeCapable | grep -Eo "(\w+)$")
if [[ $wallPower == "Yes" ]]
	then
		exit
else
	Pct=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
	if [[ $Pct -gt 10 && $Pct -le 20 ]]
		then
			osascript -e 'display notification "Less than 20% Battery Remaining, plug in soon." with title "Low Battery" sound name "Basso"'
			sleep 10m
	fi
	if [[ $Pct -lt 10 ]]
		then
	  osascript -e 'display notification "Less than 10% Battery, plug in now." with title "Critical Battery" sound name "Sosumi"'
	  sleep 5m
	fi
fi
