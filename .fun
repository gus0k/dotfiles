# Adds the current path if it does not exists to cron
g2cron () {

if [[ $(crontab -l | grep -q "$PWD" | wc -l) -eq 1 ]]; then
	echo "Si"
else
	echo "No"
fi

}
