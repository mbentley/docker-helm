# mbentley/helm

docker image for helm
based off of alpine:latest

To pull this image:
`docker pull mbentley/helm`

Example usage:

## MacOS (Docker for Mac)

```
docker run -it --rm \
  --name helm \
  -e MY_UID="$(id -u)" \
  -e MY_GID="$(id -g)" \
  -v ${HOME}/Library/Caches/helm:/data/.cache/helm \
  -v ${HOME}/Library/Preferences/helm:/data/.config/helm \
  mbentley/helm
```

## Linux

```
docker run -it --rm \
  --name helm \
  -e MY_UID="$(id -u)" \
  -e MY_GID="$(id -g)" \
  -v ${HOME}/.cache/helm:/data/.cache/helm \
  -v ${HOME}/.config/helm:/data/.config/helm \
  mbentley/helm
```
