#!/usr/bin/env bash
# Run to start the camera service (.h264 over tcp port 8080)

echo "Running camera service..."
libcamera-vid -n -t 0 --inline -o - | cvlc stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/stream1}' :demux=h26

# Read with 
# ffplay rtsp://<ip-addr-of-server>:8554/stream1 -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop
# VLC is broke
