#!/bin/bash

arch=$(uname -m)

if [[ arch == "x86_64" ]]; then
  TARGETARCH="amd64"
else
  TARGETARCH="arm64"
fi

# install go2rtc
wget -O go2rtc "https://github.com/AlexxIT/go2rtc/releases/download/v1.9.9/go2rtc_linux_${TARGETARCH}"
chmod +x go2rtc

# install ffmpeg
if [[ "${TARGETARCH}" == "amd64" ]]; then
    wget -qO ffmpeg.tar.xz "https://github.com/NickM-27/FFmpeg-Builds/releases/download/autobuild-2024-09-19-12-51/ffmpeg-n7.0.2-18-g3e6cec1286-linux64-gpl-7.0.tar.xz"
    tar -xf ffmpeg.tar.xz --strip-components 1 amd64/bin/ffmpeg amd64/bin/ffprobe
    rm -rf ffmpeg.tar.xz
else
    wget -qO ffmpeg.tar.xz "https://github.com/NickM-27/FFmpeg-Builds/releases/download/autobuild-2024-09-19-12-51/ffmpeg-n7.0.2-18-g3e6cec1286-linuxarm64-gpl-7.0.tar.xz"
    tar -xf ffmpeg.tar.xz --strip-components 1 arm64/bin/ffmpeg arm64/bin/ffprobe
    rm -f ffmpeg.tar.xz
fi

