# Docker DASH Transcoder

This repository contains the Docker build file for an Alpine Linux based base
image containing the tools `ffmpeg` and `MP4Box` useful for transcoding video
files to DASH and generating MPD playlists.

The `Dockerfile` is organised as a multi-stage build, where the first step
clones the `gpac` repository (which `MP4Box` is part of), installs all required
dependencies, compiles and installs it. The second stage of the build installs
the `ffmpeg` binary and copies the compiled `gpac` binaries from the previous
build stage.
