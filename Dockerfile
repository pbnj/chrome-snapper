# CHROME-SNAPPER
# $ docker run --rm -it --user $(id -u) -v "$(pwd):/data" chrome-snapper "https://google.com"

FROM node:8-slim
LABEL maintainer="Peter Benjamin <petermbenjamin@gmail.com>"
WORKDIR /src/chrome-snapper/
COPY [".", "/src/chrome-snapper/"]
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-unstable --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge --auto-remove -y curl \
    && rm -rf /src/*.deb \
    && npm i
VOLUME [ "/screenshot" ]
ENTRYPOINT [ "node", "index.js" ]
