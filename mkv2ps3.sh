#!/bin/bash

for entry in *.mkv
do
  filename=${entry%.*}
  codec=$(mkvinfo $entry | grep "Codec ID" | tail -1 | grep -oE '[^ ]+$')
  case "$codec" in
    A_MPEG/L3)
      audio_ext="mp3"
      ;;
    A_AAC)
      audio_ext="aac"
      ;;
  esac
  mkvextract tracks $entry 0:$filename.264 1:$filename.$audio_ext
  case "$codec" in
     A_MPEG/L3)
       ffmpeg -i $filename.$audio_ext -c:a aac $filename.aac -strict -2
       ;;
  esac
  MP4Box -new $filename.mp4 -add $filename.264 -add $filename.aac -add $filename.srt -fps 23.976
  rm *.aac
  rm *.mp3
  rm *.264
  rm $entry
  rm $filename.srt
done
