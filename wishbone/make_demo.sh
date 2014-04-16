#!/bin/sh

logi_loader logipi_wishbone.bit

cd sw
make

echo "\nNotes**********************************************************************"
echo "* Read through the README.TXT file to understand how to control the peripheral connected on the wishbone bus."
echo "* The user can use C or Python to talk to the FPGA (see README.TXT)"
echo "* Use the test_wishbone.py python file to understand how to use the logi python class to access the wishbone address space." 
echo "* Use the sw/ read_wishbone and write_wishbone c executables to talk to the FPGA"
echo "* See README.TXT and http://valentfx.com/wiki/index.php?title=LOGI_-_Wishbone_-_Project for full documentation"
echo "***************************************************************************\n"
