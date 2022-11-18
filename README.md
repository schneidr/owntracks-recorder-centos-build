## Build

```
docker build -t owntracks-recorder-centos .
# copy config.mk.in to config.mk
# edit config.mk
docker run -it --rm -v $PWD:/work -e RECORDER_VERSION=$RECORDER_VERSION owntracks-recorder-centos:latest
```

Then, copy `ocat`, `ot-recorder` and `libconfig.so.9` to the server.

## Links

- https://github.com/owntracks/recorder#building-from-source