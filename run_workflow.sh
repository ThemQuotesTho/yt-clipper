#!/bin/bash

VIDEO_URL="https://www.youtube.com/watch?v=dQw4w9WgXcQ"
START_TIME="00:00:10"
DURATION="30"

yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -o "full_video.mp4" $VIDEO_URL

ffmpeg -ss $START_TIME -i full_video.mp4 -t $DURATION -c copy clip.mp4

whisper clip.mp4 --model small --output_format srt

echo "Clip and subtitles generated:"
ls -lh clip.mp4 clip.srt
