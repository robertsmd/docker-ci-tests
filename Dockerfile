FROM docker:latest

RUN apk add python3 python3-dev

RUN apk add gcc git make

RUN apk add musl-dev glu-dev zlib-dev jpeg-dev libffi-dev openssl-dev

RUN pip3 install virtualenv docker-compose
