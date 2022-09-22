- This is perfect, does everything for you
https://github.com/aler9/rtsp-simple-server#from-a-raspberry-pi-camera

https://thomas.vanhoutte.be/miniblog/disable-the-red-and-green-lights-on-a-raspberry-pi/

# TODO disable the lights
sudo sh -c 'echo 0 > /sys/class/leds/led0/brightness'
sudo sh -c 'echo 0 > /sys/class/leds/led1/brightness'
