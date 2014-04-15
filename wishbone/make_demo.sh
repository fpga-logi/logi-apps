#!/bin/sh

logi_loader logipi_wishbone.bit

cd sw
make

echo "\nNotes*************************************************************************************"
echo "* Read through the README file to understand how to control the peripheral connected on the wishbone bus."
echo "* Use the test_wishbone.py python file to understand how to use the logi python class to access the wishbone address space." 
echo "********************************************************************************************\n"
