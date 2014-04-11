#!/bin/sh

read -p "What is your sensor version (7670, 7725, ...)" CAMERA

BOARD_VERSION=R1
sudo logi_loader ./logibone_camera_${BOARD_VERSION}_${CAMERA}.bit

if [ -f .done ]
then
cd ../tools/logi-mjpg-streamer/
./launch_streamer.sh 0
exit
fi

apt-get update
apt-get install gcc make v4l-utils libjpeg8-dev
ln -s /usr/include/linux/videodev2.h   /usr/include/linux/videodev.h

cd ../tools/logi-mjpg-streamer/
make -j2
echo "done" > .done

echo "Demo will now start :"
echo "Open a browser and connect to http://<your beaglebone ip address>:8080/stream.html"
echo "Use switches on the logibone to switch between video source (normal, gaussian, sobel, harris)"
echo "Press ctrl-c to end demo"

./launch_streamer.sh 0
