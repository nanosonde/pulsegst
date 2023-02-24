# pulsegst
Custom build of pulseaudio and gstreamer for use with sip2rtsp.

The packages can be found here: https://github.com/nanosonde/pulsegst/pkgs/container/pulsegst

**Note**: the resulting docker images for various CPU architectures only contain the compiled files (binaries/libs, etc.) of gstreamer and pulseaudio for use with another multistage dockerfile.
```
[...]
COPY --from=pulsegstimage /usr/local/pulseaudio/ /usr/local/pulseaudio/
COPY --from=pulsegstimage /usr/local/gstreamer/ /usr/local/gstreamer/
[...]
```
