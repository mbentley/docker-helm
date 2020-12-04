FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

# find an install the latest version of helm
RUN apk --no-cache add wget jq shadow &&\
  HELM_VER="$(wget -q -O - https://api.github.com/repos/helm/helm/releases/latest | jq -r .tag_name)" &&\
  wget "https://get.helm.sh/helm-${HELM_VER}-linux-amd64.tar.gz" -O /tmp/helm.tar.gz &&\
  cd /tmp &&\
  tar -zxvf /tmp/helm.tar.gz &&\
  rm /tmp/helm.tar.gz &&\
  mv linux-amd64/helm /usr/local/bin/helm &&\
  rm -rf linux-amd64 &&\
  apk --no-cache del wget jq

# install gosu & kubectl
RUN echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories &&\
  apk add --no-cache gosu@edge kubectl@edge

# copy entrypoint
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["helm","help"]

