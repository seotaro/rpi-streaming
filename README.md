# ラズパイでストリーミング

## 共通の設定

raspi-config でカメラを有効にして、GPU メモリ を 256MB にする。
次にカメラを v4l2（= Video for Linux 2）で使えるようにする。

カメラが /dev/video0 で認識されているはず。

```bash
v4l2-ctl --list-devices

mmal service 16.1 (platform:bcm2835-v4l2-0):
	/dev/video0
```

ドライバを登録する。/etc/modules に "bcm2835-v4l2" を追記してリブート。

```bash
cat /etc/modules
# /etc/modules: kernel modules to load at boot time.
#
# This file contains the names of kernel modules that should be loaded
# at boot time, one per line. Lines beginning with "#" are ignored.
bcm2835-v4l2
```

## RTSP

[v4l2rtspserver](https://github.com/mpromonet/v4l2rtspserver) でストリーミング
docker イメージを使えば簡単に始められる。

【参考】[Makefile](rtsp/Makefile)

## HLS

nginx で RTMP サーバー、HLS 形式でストリーミング

【参考】[Makefile](hls/Makefile)

## WebRTC

[WebRTC Native Client Momo](https://github.com/shiguredo/momo) のテストモードでストリーミング

【参考】[Makefile](webrtc/Makefile)
