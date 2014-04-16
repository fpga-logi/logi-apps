#!/bin/sh

#read -p "What is your board version (RA1, RA2, RA3)" BOARD_VERSION

BOARD_VERSION=R1
sudo logi_loader ./logipi_mining_${BOARD_VERSION}.bit

DISTRO="$(cat /etc/os-release | grep "ID_LIKE=.*" | sed "s,ID_LIKE=,,")"
echo $DISTRO

if [ -f .done ]
then

if [ "$DISTRO" = "arch" ]; then
PYTHON=python2
else
PYTHON=python
fi

echo "\nINSTRUCTIONS *******************************************************************************"
echo "* This is a demo of the FPGA running the bitcoin mining Algorithm.  The FPGA iteratively cycle through the algorithm looking for the solution (nonce).  Once the solution is found the FPGA will report the solution back to the Pi/Bone and be displayed on the screen."
echo "\n* The full minig support for the minor is no longer supported as this is simply for demo purposes and there are much better / cost effective solution avialable now that have replaced FPGAs."
echo "\nINFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating." echo "Because of the low hashrate (compared to bigger FPGA or ASIC)."
echo "*********************************************************************************************"

$PYTHON logipi.py
exit
fi


if [ "$DISTRO" = "debian" ]; then
sudo apt-get update
sudo apt-get install python-dev

echo "\nINSTRUCTIONS *******************************************************************************"
echo "* This is a demo of the FPGA running the bitcoin mining Algorithm.  The FPGA iteratively cycle through the algorithm looking for the solution (nonce).  Once the solution is found the FPGA will report the solution back to the Pi/Bone and be displayed on the screen."
echo "\n* The full minig support for the minor is no longer supported as this is simply for demo purposes and there are much better / cost effective solution avialable now that have replaced FPGAs."
echo "\nINFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating." echo "Because of the low hashrate (compared to bigger FPGA or ASIC)"
echo "******************************************************************************************"



PYTHON=python
elif [ "$DISTRO" = "arch" ]; then
pacman -S --needed python2
PYTHON=python2
else
echo "unknown distro, please manually install gcc, make, v4l-utils, libjpeg-turbo"
PYTHON=python
fi

git clone https://github.com/lthiery/SPI-Py.git spi_lib
cd spi_lib
$PYTHON setup.py build
sudo $PYTHON setup.py install
cd ..
echo "done" > .done

echo "wait for the following script to end"
echo "result should be : nonce :7a33330e "

echo "\nINSTRUCTIONS *******************************************************************************"
echo "* This is a demo of the FPGA running the bitcoin mining Algorithm.  The FPGA iteratively cycle through the algorithm looking for the solution (nonce).  Once the solution is found the FPGA will report the solution back to the Pi/Bone and be displayed on the screen."
echo "* The full minig support for the minor is no longer supported as this is simply for demo purposes and there are much better / cost effective solution avialable now that have replaced FPGAs."
echo "INFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating." echo "Because of the low hashrate (compared to bigger FPGA or ASIC), expect to wait some time before getting a valid share ..." $PYTHON logibone.py


echo "INFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating."
echo "Because of the low hashrate (compared to bigger FPGA or ASIC), expect to wait some time before getting a valid share ..."
$PYTHON logipi.py
