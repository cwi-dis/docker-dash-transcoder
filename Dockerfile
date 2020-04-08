FROM alpine:3.11 as compile_step

RUN apk add --no-cache git
RUN git clone https://github.com/gpac/gpac.git
WORKDIR /gpac

RUN apk add --no-cache gcc libc-dev zlib zlib-dev coreutils make
RUN ./configure --use-zlib=local && \
    make && \
    make install

FROM alpine:3.11

RUN apk add --no-cache ffmpeg

COPY --from=compile_step /usr/local/lib /usr/local/lib
COPY --from=compile_step /usr/local/bin /usr/local/bin
