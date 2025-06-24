stream_name="$1"
type="$2"

if [[ $type == "mixed" ]]; then
  bin/ffmpeg -vn -threads 1 -hide_banner -loglevel warning -threads 2 -rtsp_transport tcp -timeout 10000000 -i 'rtsp://127.0.0.1:8554/${stream_name}' -f segment -segment_time 10 -segment_format mp4 -reset_timestamps 1 -strftime 1 -c:v copy -c:a aac /tmp/cache/front_cam@%Y%m%d%H%M%S%z.mp4 -r 8 -vf fps=8,scale=2560:720 -avioflags direct -flush_packets 1 -strict experimental -threads 1 -f rawvideo -pix_fmt yuv420p pipe:
elif [[ $type == "record" ]]; then
  bin/ffmpeg -vn -threads 1 -hide_banner -loglevel warning -threads 2 -rtsp_transport tcp -timeout 10000000 -i 'rtsp://127.0.0.1:8554/${stream_name}' -f segment -segment_time 10 -segment_format mp4 -reset_timestamps 1 -strftime 1 -c:v copy -c:a aac /tmp/cache/front_cam@%Y%m%d%H%M%S%z.mp4
else
  bin/ffmpeg -vn -threads 1 -hide_banner -loglevel warning -threads 2 -rtsp_transport tcp -timeout 10000000 -i 'rtsp://127.0.0.1:8554/${stream_name}' -r 8 -vf fps=8,scale=2560:720 -avioflags direct -flush_packets 1 -strict experimental -threads 1 -f rawvideo -pix_fmt yuv420p pipe:
fi
