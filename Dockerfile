FROM alpine:3.11

RUN apk add --no-cache git ffmpeg
RUN git clone https://github.com/gpac/gpac.git
WORKDIR /gpac

RUN apk add --no-cache gcc libc-dev zlib zlib-dev coreutils make
