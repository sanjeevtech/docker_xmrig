# Alpine XMRig

* Xmrig 5.5.3 
* CPU monero miner [XMRig](https://github.com/xmrig/xmrig)
* donation 0%
* built on Alpine linux - only 60 MB container size with no decrease in performance
* compiled with gcc 9 for better [performance](https://github.com/xmrig/xmrig/wiki/Ubuntu-Build#gcc-71)


![MacDown Screenshot](https://github.com/donAFRO/docker_xmrig/raw/master/screenshot.png)

# Usage

### Run

```bash
docker run -d --restart always donafro/xmrig
```

### Build
Modify the CMD in [Dockerfile](https://github.com/donAFRO/docker_xmrig/blob/master/Dockerfile) with your own configuration, build it and run it.

```bash
docker build -t xmrig .
docker run -d xmrig
```
Or you can override those configurations **without building** the image yourself when running the image

```bash
docker run -it --rm donafro/xmrig -k --max-cpu-usage=100 \
     --pass=another_miner --url=xmr.bohemianpool.com:4444 \
     --user=48yhqUEN7Kf2g2umMP3qWq3FMZATzhddmKsSVurkaceUMmWcfS7AWL71EjpbRReaG9U12GVeLVw8TMGtmNRxVT8pNDbx3S6
```
