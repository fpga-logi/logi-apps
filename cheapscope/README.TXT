*************************************************************************************************************
* LOGI Cheapscope (by Hamster) Logic Analyzer ******** *******************************************************
* REQUIRMENT: Best graphics are seen when running on RASPBIAN DESKTOP, but will work on SSH terminal
* DOCUMENTATION: For full documentation see: http://valentfx.com/wiki/index.php?title=LOGI_-_Hamster_Cheapscope_Logic_Analyzer_-_Project and http://hamsterworks.co.nz/mediawiki/index.php/CheapScope
* DESCRIPTION:  ************************
* Cheapscope is a hardware buffering implementation that is constantly monitoring predefined FPGA signals.  The user can set a pre-defined trigger pattern that once detected, writes the buffered signal data to the Raspberry Pi through it’s UART connection.  The Raspberry Pi host software receives the buffered data and creates visual representation of the data directly within a terminal window.  The user then has options to scroll through the channel data, view and interpret the captured channel data.
* BASIC INSTRUCTIONS  ******************
* Run make_demo.sh from the cheapscope directory.  This will disable the ttyAMA0 port the first time it is run.  It will restart the Raspberry Pi and you will need to run make_demo.sh a second time.  
* Push PB1 to capture the data and it will be displayed in the terminal window.  
* Resize the window to display all channels
* Scroll through the capture data using the left and right keyboard keys
* Press PB1 to continue to capture new snapshots
* Press N to view buffered more snapshot data
**************************************************************************************************************
