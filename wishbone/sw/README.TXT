OVERVIEW ***************************************************************************************************************
WISHBONE ADDRESSES ************************************************************$
address    |    name       |    note    |
0x0000       register_0        read :0xDEAD
0x0001       register_1        read : 0xBEEF
0x0002       register_3        read/write register
0x0003       register_4        write pmod2/read pmod1 and switches
0x0008       pwm_divider       system_clock divider for pwm
0x0009       pwm_period        pwm signal period
0x000A       pwm0_high         high time for pwm0 (unconnected)
0x000B       pwm1_high         high time for pwm1 connected to LED0
0x000C       pwm2_hight        high time for pwm2 connected to LED1



* USING THE PYTHON WISHBONE WRAPPER APIs *********************************************************************************************
The simplest way to read and write data to the FPGA is using is using the high level python wishbone API ca$

Running the demo:  The user can directly run the wishbone demo by running the test_wishbone.py script:
$ "sudo python2 test_wishbone.py"

* USING THE C WISHBONE DRIVERS ********************************************************************************************************
need to compile read/write tools on beaglebone with the following commands (too lazy to write the Makefile):
gcc -o write_wishbone write_wishbone.c
gcc -o read_wishbone read_wishbone.c

* read tool usage :
sudo read_wishbone <hex address>
example : sudo read_wishbone 0x0001

* write tool usage:
sudo write_wishbone <hex address> <hex value>
example : sudo write_wishbone 0x0001 0xBEEF 

WISHBONE WALK-THROUGH EXAMPLES *********************************************************************************************************

READ REGISTER ON THE FPGA
1) Read register 0x0000 on the FPGA
	sudo ./read_wishbone 0x0000
	should return 0xdead
2) Read register 0x0001 on the FPGA
	sudo ./read_wishbone 0x0001
	should return 0xbeef

WRITE AND READ AN UNINITIALIZED REGISTER ON THE FPGA
1) read the uninitialized register_3 (0x0002)
	sudo ./read_wishbone 0x0002
	should return: 0x0 
2) write a value of 0x1234 to register_3  
	sudo ./write_wishbone 0x0002 0x1234
	should output: Writing 0x1234 @ 0x2 
3) read back the contents stored in register_3
	sudo ./read_wishbone 0x0002
	should return: 0x1234 


SETUP LED PWM REGISTER TO CONTROL THE INTENSITY OF THE LEDS
1) Load the clock divider register with 0x0008
 	sudo ./write_wishbone 0x0008 0x0004
	should return: Writing 0x4 @ 0x8 

2) Load the period register with 0x0800
	sudo ./write_wishbone 0x0009 0x0800
	should return: Writing 0x800 @ 0x09 
3) Load the LED1 register with the duty cycle value
	sudo ./write_wishbone 0x000B 0x0080
	should return: Writing 0x80 @ 0x0B 
	you should see LED1 light up with the brightness relative to pwm_period/pwm_duty(high time)
4) Load the LED2 register with the duty cycle value
	sudo ./write_wishbone 0x000C 0x0080
	should return: Writing 0x80 @ 0x0C 
	you should see LED2 light up with the brightness relative to pwm_period/pwm_duty(high time)
5) Experiment with setting the brightness of the LEDS by writing the the pwm_high registers

