#!/bin/sh

BOARD_VERSION=R1
sudo logi_loader ./logibone_mining_${BOARD_VERSION}.bit

PYTHON=python
if [ -f .done ]
then

echo "\nINSTRUCTIONS *******************************************************************************"
echo "* This is a demo of the FPGA running the bitcoin mining Algorithm.  The FPGA iteratively cycle through the algorithm looking for the solution (nonce).  Once the solution is found the FPGA will report the solution back to the Pi/Bone and be displayed on the screen."
echo "\n* The full minig support for the minor is no longer supported as this is simply for demo purposes and there are much better / cost effective solution avialable now that have replaced FPGAs."
echo "\nINFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating." echo "Because of the low hashrate (compared to bigger FPGA or ASIC)"
echo "******************************************************************************************"

$PYTHON logibone.py
exit
fi

touch .done

echo "wait for the following script to end"
echo "result should be : nonce :7a33330e "

echo "\nINSTRUCTIONS *******************************************************************************"
echo "* This is a demo of the FPGA running the bitcoin mining Algorithm.  The FPGA iteratively cycle through the algorithm looking for the solution (nonce).  Once the solution is found the FPGA will report the solution back to the Pi/Bone and be displayed on the screen."
echo "\n* The full minig support for the minor is no longer supported as this is simply for demo purposes and there are much better / cost effective solution avialable now that have replaced FPGAs."
echo "\nINFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating." echo "Because of the low hashrate (compared to bigger FPGA or ASIC)"
echo "******************************************************************************************"

