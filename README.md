# mkv2ps3
Simple bash script to remux mkv to be watched on PS3. It's not been tested on a PS3, yet.

It uses `ffmpeg`, `mkvinfo`, `mkvextract`, and `MP4Box`. You can install the whole set with:

```
sudo apt install ffmpeg gpac mkvtoolnix
```

`ffmpeg` is only used when the audiotrack needs to be converted to AAC. If you're on Ubuntu on Windows, you may need to compile `ffmpeg` from sources. Follow this: https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#CompilationInstallation
