#!/bin/sh

logi_loader  logipi_virtual_component.bit

if [ -f .done ]
then
cat README.TXT
python2 virtual_component.py
exit
fi

#.done file has not been run
echo "We need to make sure pygame is installed.  This will only run one time"
apt-get update
sudo apt-get install python-pygame

echo "done" > .done

#run the app after updated
cat README.TXT
python2 virtual_component.py

