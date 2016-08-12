#!/bin/sh

echo "Stop. Who would cross the bridge of death must answer me these questions three, ere the other side he see. What... is your name?" | cowsay

echo ""

trap "echo 'What... is the air-speed of an unladden swallow?' | cowsay" SIGINT SIGTERM
trap "echo 'Tis but a scratch... I have had worse... Its just a flesh wound... Actually, this is pretty bad, I should go to a hospital' | cowsay -f mutilated" SIGHUP

sleep 3s
sleep 3s
sleep 3s
sleep 1s

echo "Brave Sir Robin ran away, Bravely ran away away, When danger reared its ugly head he bravely turned his tail and fled. Yes, brave Sir Robin turned about, And gallantly he chickened out." | cowsay

