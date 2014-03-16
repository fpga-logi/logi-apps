#!/bin/sh
git clone git://github.com/slush0/stratum-mining-proxy.git
cd stratum-mining-proxy
sudo apt-get install python-dev python-twisted
sed -i "s/'twisted>=12.2.0',//" setup.py
sudo python distribute_setup.py
sudo python setup.py develop
