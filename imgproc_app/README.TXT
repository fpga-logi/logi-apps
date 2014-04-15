* Description ******************************************************************
* The LOGI image processing demo is intended to be a plug and play demo of machine vision using the LOGI baords.  Machine vision applications are can be very data processing intensive, which makes them a perfect candiate for an FPGA.  The demo capture image data, image processes and streams the data using mpjeg streamer to an networked remote PC.  The user can view the stream by simply opening a web browser and entering the ip address of the connected bone/pi followed by port :8080.  
* For full project overview see: 
http://valentfx.com/wiki/index.php?title=LOGI_-_Image_Processing_-_Project
* The Demo cycles three image processing filter: Gaussian, Sobel, Harris.

*Instructions **********************************************************************
1) Run the ./make_demo.sh from the command line
2) input the camera being used - 7670 is default
3) Open a browser and connect to http://<your Raspberry Pi ip address>:8080/stream.html"
