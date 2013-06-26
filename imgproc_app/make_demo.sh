#!/bin/sh
logi_loader ./logipi_camera.bit

DISTRO="$(cat /etc/os-release | grep "ID_LIKE=.*" | sed "s,ID_LIKE=,,")"
echo $DISTRO
if [ "$DISTRO" = "debian" ]; then
apt-get install gcc make v4l-utils libjpeg-turbo
elif [ "$DISTRO" = "arch" ]; then
pacman -S --needed gcc make v4l-utils libjpeg-turbo
else
echo "unknown distro, please manually install gcc, make, v4l-utils, libjpeg-turbo"
fi
cd ../tools/logi-mjpg-streamer/
./fix_dependency.sh
make -j2
echo "Demo will now start :"
echo "Open a browser and connect to http://<your raspberry ip address>:8080/stream.html"
echo "Press PB2 on logibone to switch between video source (normal, gaussian, sobel, harris)"
echo "Press ctrl-c to end demo"
./launch_streamer.sh 0
