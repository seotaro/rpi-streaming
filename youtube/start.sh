#!/bin/bash
if pidof -x ffmpeg > /dev/null; then
    echo "FFmpeg is already running."
    exit 1
fi

STREAM_KEY=6za6-kdbe-swtu-k6mh-2x34

ffmpeg \
    -re -ar 44100 -ac 2 -c:a pcm_s16le -f s16le -ac 2 -i /dev/zero \
    -f v4l2 -thread_queue_size 8192 -input_format yuyv422 \
    -video_size 1280x720 -framerate 30 -i /dev/video0  \
    -c:v h264_omx -b:v 3000k -c:a copy -b:a 32k  \
    -bufsize 3000k -vsync 1 -g 60 \
    -f flv rtmp://a.rtmp.youtube.com/live2/${STREAM_KEY} \
    > /dev/null 2>&1 < /dev/null