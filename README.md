# pulsegst
Custom build of pulseaudio and gstreamer for use with sip2rtsp.

Versions:
* pulseaudio: 16.1
* gstreamer 1.22.1

The packages can be found here: https://github.com/nanosonde/pulsegst/pkgs/container/pulsegst

**Note**: the resulting docker images for various CPU architectures only contain the compiled files (binaries/libs, etc.) of gstreamer and pulseaudio for use with another multistage dockerfile. Nothing else.
```
[...]
COPY --from=pulsegstimage /usr/local/pulseaudio/ /usr/local/pulseaudio/
COPY --from=pulsegstimage /usr/local/gstreamer/ /usr/local/gstreamer/
[...]
```
