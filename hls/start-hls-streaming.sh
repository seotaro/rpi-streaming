#!/bin/bash
if pidof -x ffmpeg > /dev/null; then
    echo "FFmpeg is already running."
    exit 1
fi

ffmpeg \
    -f v4l2 -thread_queue_size 8192 -input_format yuyv422 \
    -video_size 1280x720 -framerate 30 \
    -i /dev/video0 \
    -c:v h264_omx -b:v 3000k \
    -bufsize 3000k -vsync 1 -g 10 \
    -f flv rtmp://localhost/live/stream \
    > /dev/null 2>&1 < /dev/null