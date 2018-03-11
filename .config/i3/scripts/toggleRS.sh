## Toggle redshift on/off

rsprocess=$(ps -ef | grep redshift | grep -v "grep" | wc -l)

echo $rsprocess

if [ $rsprocess -ge 1 ]; then
	killall redshift;
else
	redshift -l 54.95:-1.56 -t 6500:5000 -g 0.8 -m randr &
fi
