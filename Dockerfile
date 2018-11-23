FROM alpine:edge

RUN apk add --update --no-cache --virtual build-deps build-base cmake git \
    && apk add --update --no-cache libuv-dev libmicrohttpd-dev libressl-dev \
    && git clone https://github.com/xmrig/xmrig \
    && sed -i 's/kDefaultDonateLevel = 5/kDefaultDonateLevel = 0/g' /xmrig/src/donate.h \
    && sed -i 's/kMinimumDonateLevel = 1/kMinimumDonateLevel = 0/g' /xmrig/src/donate.h \
    && mkdir /xmrig/build \
    && cd /xmrig/build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && apk del build-deps

RUN adduser -S -D -H -h /xmrig monero
USER monero
WORKDIR /xmrig

ENTRYPOINT  ["./build/xmrig"]

CMD ["--url=xmr.bohemianpool.com:5555", \
     "--user=48yhqUEN7Kf2g2umMP3qWq3FMZATzhddmKsSVurkaceUMmWcfS7AWL71EjpbRReaG9U12GVeLVw8TMGtmNRxVT8pNDbx3S6", \
     "--pass=docker_hub_miner", \
     "-k", "--max-cpu-usage=100"]
