#!/bin/sh

CUR_DIR=`pwd`

#read -p "What is your board version (RA1, RA2, ...)" BOARD_VERSION
read -p "What is your sensor version (7670, 7725, ...)" CAMERA

BOARD_VERSION=R1
sudo logi_loader ./logipi_camera_${BOARD_VERSION}_${CAMERA}.bit

if [ -f .done ]
then
cd ../tools/logi-mjpg-streamer/
echo "\nDEMO NOW RUNNING ***************************************************************************"
echo "* Demo will now start :"
echo "* Open a browser and connect to http://<your beaglebone ip address>:8080/stream.html"
echo "* Use switches on the logibone to switch between video source (normal, gaussian, sobel, harris)"
echo "* full documentation on this app:\nhttp://valentfx.com/wiki/index.php?title=LOGI_-_Image_Processing_-_Project"
echo "* Press ctrl-c to end demo"
echo "END INSTRUCTIONS ***************************************************************************\n"

./launch_streamer.sh 0
exit
fi

DISTRO="$(cat /etc/os-release | grep "ID_LIKE=.*" | sed "s,ID_LIKE=,,")"
echo $DISTRO
if [ "$DISTRO" = "debian" ]; then
apt-get update
apt-get install gcc make v4l-utils libjpeg8-dev
ln -s /usr/include/linux/videodev2.h   /usr/include/linux/videodev.h
elif [ "$DISTRO" = "arch" ]; then
pacman -S --needed gcc make v4l-utils libjpeg-turbo
ln -s /usr/include/libv4l1-videodev.h   /usr/include/linux/videodev.h
else
echo "unknown distro, please manually install gcc, make, v4l-utils, libjpeg-turbo"
fi

cd ../tools/logi-mjpg-streamer/
make -j2

touch ${CUR_DIR}/.done

echo "\nDEMO NOW RUNNING ***************************************************************************"
echo "* Demo will now start :"
echo "* Open a browser and connect to http://<your beaglebone ip address>:8080/stream.html"
echo "* Use switches on the logibone to switch between video source (normal, gaussian, sobel, harris)"
echo "* full documentation on this app:\nhttp://valentfx.com/wiki/index.php?title=LOGI_-_Image_Processing_-_Project"
echo "* Press ctrl-c to end demo"
echo "END INSTRUCTIONS ***************************************************************************\n"


./launch_streamer.sh 0
