#!/bin/sh

git clone https://github.com/lthiery/SPI-Py.git spi_lib
cd spi_lib
python2 setup.py build
python2 setup.py install
cd ..
DISTRO="$(cat /etc/os-release | grep "ID_LIKE=.*" | sed "s,ID_LIKE=,,")"
echo $DISTRO
if [ "$DISTRO" = "debian" ]; then
apt-get install python-json python-mmap
elif [ "$DISTRO" = "arch" ]; then
pacman -U python-json python-mmap
else
echo "unknown distro, please manually install gcc, make, v4l-utils, libjpeg-turbo"
fi
logi_loader ./logipi_mining.bit
echo "wait for the following script to end"
echo "result should be : nonce :7a33330e "
echo "1) Create an account on mining pool (tested on btcguild and bitlc)"
echo "2) Configure a worker on the pool website"
echo "3) Fill config.py with your worker configuration"
echo "4) Launch python mark1_rpi_miner.py and wait to get rich ..."
echo "INFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating."
echo "Because of the low hashrate (compared to bigger FPGA or ASIC), expect to wait some time before getting a valid share ..."
python2 logipi.py
