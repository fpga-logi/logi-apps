
import time
from logi import *

logiWrite(0x0008, (0x04, 0x00))
logiWrite(0x0009, (0x00, 0x08))
t = 0
while True:
	val = abs(int(0x0800 * sin(t)))
	logiWrite(0x000A, ((val & 0x00FF), (val >> 7))
	time.sleep(0.1)
	t = t + 0.1
