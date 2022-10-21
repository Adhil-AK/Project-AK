FROM arkonn/mltb:heroku
# FROM codewithweeb/weebzone:stable

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt -qq update --fix-missing && \
    apt -qq install -y \
    mediainfo

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get upgrade -y

RUN pip3 install aria2p && pip3 install qbittorrent-api && \
    pip3 install ffmpeg && pip3 install yt-dlp && pip3 install megasdkrestclient && \
    pip3 install mediainfo && pip3 install anytree && pip3 install asgiref && \
    pip3 install asyncio && pip3 install gunicorn && pip3 install lk21 && \
    pip3 install lxml && pip3 install pyrogram && pip3 install python-telegram-bot && \
    pip3 install urllib3 pip3 install tgCrypto
RUN apt-get update && apt-get upgrade -y

CMD ["bash", "start.sh"]
