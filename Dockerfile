FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache gcc python3-dev git py3-pip ffmpeg
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ megatools
RUN python3 -m venv /app/venv
RUN mkdir /app/
WORKDIR /app/
RUN git clone -b nightly https://github.com/Itz-fork/Mega.nz-Bot.git /app
RUN /app/venv/bin/pip install -U -r requirements.txt
CMD ["/app/venv/bin/python3", "-m", "megadl"]
