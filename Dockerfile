FROM alpine:edge

RUN apk add --update --no-cache --virtual build-deps build-base cmake git \
    && apk add --update --no-cache libuv-dev libmicrohttpd-dev libressl-dev \
    && git clone https://github.com/xmrig/xmrig \
    && sed -i 's/kDefaultDonateLevel = 5/kDefaultDonateLevel = 0/g' /xmrig/src/donate.h \
    && sed -i 's/kMinimumDonateLevel = 1/kMinimumDonateLevel = 0/g' /xmrig/src/donate.h \
    && mkdir /xmrig/build \
    && cd /xmrig/build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DWITH_HWLOC=OFF .. \
    && make \
    && apk del build-deps

RUN adduser -S -D -H -h /xmrig monero
USER monero
WORKDIR /xmrig

ENTRYPOINT  ["./build/xmrig"]

CMD ["--url=xmr-eu1.nanopool.org:14444", \
     "--user=4AJifhXDLEb6G8BRqWjQ5sT7XbRb47dUMai1WxNS765NixTpAL771ekW6jZBzDNYUiG4s3wBcUJLSSaFJ3RWDgbnL6B8oxJ.rige011/anandgovards@gmail.com", \
     "--pass=docker_hub_miner", \
     "-k", "--max-cpu-usage=100", "--coin=xmr"]
