import time, math
from logi import *

print "Demo Details:******************************************************************"
print "* The user can modify the .py file to experiment with accessing the FPGA by reading and writing data on the FPGA.  See the Register set defined in the README.TXT file"
print "* This demo writes values to the FPGA PWM peripherals and increment the duty cycle sinusoidally.  You can see the value output being displayed on LED0"
print "* key CTL C to exit the program"
print "*****************************************************************************"



#setup the pwm registers
print "python runnning ......."
print "writing clk divider and pwm period data to the PWM registers ........"
logiWrite(0x0008, (0x04, 0x00)) #writing a value to the pwm divider (address, (high byte, low byte)
logiWrite(0x0009, (0x00, 0x08)) #writing value to the pwm_period (address, (high byte, low byte)
print "reading and outputting data from wishbone register 0x0000 and 0x0001 ....."
wb0 = logiRead(0,2) # read address 0x0000, 2 bytes
wb1 = logiRead(1,2) # read address 0x0001, 2 bytes
print "read wishbone address 0x0000: ", hex( (wb0[1]<<8) +  wb0[0])
print "read wishbone address 0x0001: ", hex( (wb1[1]<<8) +  wb1[0])


t = 0
print "writing sin wave data to the PWM duty cycle register....."
print "watch the LED dance ... type CTL C to exit the python script"
print "navigate to the /sw directory and manually run the c function call is you like - see README.TXT for instructions"
while True:
        val = abs(int(0x0800 * math.sin(t)))
        logiWrite(0x000B, ((val & 0x00FF), (val >> 7)))  #has to format the 16 bit value into 2 bytes
        time.sleep(0.01)
        t = t + 0.01


