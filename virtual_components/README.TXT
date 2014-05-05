* LOGI Virtual Components demo *******************************************************
* REQUIRMENT: MUST RUN THIS APP FROM RASPBIAN DESKTOP
* Description ************************
* For full documentation see: http://valentfx.com/wiki/index.php?title=LOGI_-_Virtual_Components_-_Project
* Virtual components are graphical components that represent real components.  The virtual components act and responsd the same as a real components would respond.  The virtual are created using the pygame library and run on Raspbian desktop.  Virtual components allow the users to add any type of components without need to buy or physically connect a real component.  The virtual components communicate with the FPGA through the LOGI wishbone bus.
* The DIP SWx 8 , LEDS x8 , SSEG x4 and PB x 4 communicate with the FPGA and can send and receive information to emulate a "Real" breadboard
* Basic instructions ******************
* VIRTUAL COMPONENTS FUNCTIONALITY:
* VDIPSW(8): 1 =  enables the SSEG to begin counting
* VDIPSW(7): 0 = binary count,  1 = "knight rider" : toggles between the LEDS displaying the binary and the "knigh rider" cylon side to side scroll 
* VDIPSW(6): 0 = standard LED, 1 = VPB to fpga LED and fpga DIPSW to VLED : if dip switch 6 is high you can press the virtual push buttons and the Real LEDs on the fpga board will follow the virutal push butttons 3 and 4.  The Virtual LEDS will follow Real Dip Sw value from the LOGI board.
* VDIPSW(1:2): 00-11 : This will increment the count value which drivers the SSEG count and the binary count on the LEDS.  
* VPB(1): 1 = reset count : pushing virtual PB0 will reset the SSEG and binary count
* VPB(3): 1 = will enable the Real LED on FPGA board when VDIPSW(6) is = 1.
* VPB(4): 1 = will enable the Real LED on FPGA board when VDIPSW(6) is = 1.  
* REAL COMPONENTS FUNCTIONALITY:
* DIPSW(1:2): The Virtual LED 7 and 8 will follow the DIP SW value when VDIPSW(6) is = '1'
* SW(2): This will reset the count variable
* LED(1:2): Will display the low 2 bits of the count when VDIPSW(7)= '1' or will display VPB(3:4) when DIPSW(6) = '1'
* PB(1): This will reset the FPGA
* PB(2): This will reset the count 
