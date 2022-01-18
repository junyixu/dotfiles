#! /bin/sh


yt-dlp \
–format bestvideo+bestaudio \
–cookies= ~/Videos/youtube-dl/youtube_cookies.txt \
–limit-rate 2M \
"$@"
