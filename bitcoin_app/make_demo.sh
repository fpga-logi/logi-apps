#!/bin/sh

BOARD_VERSION=R1
sudo logi_loader ./logibone_mining_${BOARD_VERSION}.bit


if [ -f .done ]
then
PYTHON=python
$PYTHON logibone.py
exit
fi

echo "done" > .done
echo "wait for the following script to end"
echo "result should be : nonce :7a33330e "
echo "1) Create an account on mining pool (tested on btcguild)"
echo "2) Configure a worker on a pool website"
echo "3) If your pool server uses stratum (btcguild uses stratum)"
echo "	3-1) run the install_stratum_proxy script : ./install_stratum_proxy"
echo "	3-2) launch the proxy with your pool informations : ./stratum_proxy/mining_proxy.py -o <pool-url> -p <port> -sp 3334 -gp 8332"
echo "	3-3) Fill config.py with worker name and \"host\" = \"127.0.0.1\", \"port\"=8332 as server info"
echo "4) Fill config.py with your worker configuration"
echo "4) Launch python logipi_miner.py and wait to get rich ..."
echo "INFO: the hashrate (~1.8MHash/s) is intentionnaly limited to prevent the FPGA from overheating."
echo "Because of the low hashrate (compared to bigger FPGA or ASIC), expect to wait some time before getting a valid share ..."
$PYTHON logibone.py
