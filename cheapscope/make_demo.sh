#!/bin/sh

logi_loader  logipi_virtual_component.bit

if [ -f .done ]
then
logi_loader  cheapscope_count_demo.bit
cat README.TXT
./cheapscope /dev/ttyAMA0
exit
fi

#.done file has not been run -- Run the setup 
echo ".................Installing libncurses ................"
sudo apt-get install libncurses5-dev
echo "...................building cheapscope ................"
#gcc -o cheapscope cheapscope.c -lncurses #using the pre-compiled.


echo ".............We must disable ttyAMA0 and restart.........."
./rpi-serial-console disable
echo "YOU MUST RESTART THE RPI BEFORE RUNNING THIS DEMO (restart with ttyAMA0 disabled)"
echo "done" > .done


echo "* Re-run the make_demo script when the Rpi restarts......"
echo "....................RESTARTING NOW ......................"
shutdown -r now
