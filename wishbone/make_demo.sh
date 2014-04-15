#!/bin/sh

logi_loader logipi_wishbone.bit

cd sw
make

echo "Read through the sw/README file to understand how to control the peripheral connected"
echo "on the wishbone bus."
echo "Use the test_wishbone.py python file to understand how to use the logi python class to access"
echo "the wishbone address space." 
