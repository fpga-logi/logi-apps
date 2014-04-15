#!/bin/sh

logi_loader logibone_wishbone_r1.bit

cd sw
make

echo "\nNotes*************************************************************************************"
echo "* Read through the sw/README file to understand how to control the peripheral connected on the wishbone bus."
echo "* Use the test_wishbone.py python file to understand how to use the logi python class to access the wishbone address space." 
echo "* 1) user can run the python wishbone with command 'sudo python2 test_wishbone.py' " 
echo "* 2) user can run the c code wishbone fucntiona call by using the /sw ./write_wishbone and ./read_wishbone  - See the sw/README.TXT"
echo "********************************************************************************************\n"

