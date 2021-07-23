# ラズパイでストリーミング

## 共通の設定

raspi-config でカメラを有効にして、GPU メモリ を 256MB にする。
次にカメラを v4l2（= Video for Linux 2）で使えるようにする。

カメラが /dev/video0 で認識されているか確認。

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

再生できるプレイヤーが限定される。

- [v4l2rtspserver](https://github.com/mpromonet/v4l2rtspserver) 
  - docker イメージを使えば簡単に始められる。
  - [Makefile](rtsp/Makefile)

## HLS

遅延が大きい。

- nginx で RTMP サーバー、HLS 形式でストリーミング
  - [Makefile](hls/Makefile)

- [v4l2rtspserver](https://github.com/mpromonet/v4l2rtspserver) 
  - コマンドラインオプションで HLS 配信ができるとあるが、ラズパイ ZERO ではまともに動かなかった。

## WebRTC

遅延が少ない。

- [WebRTC Native Client Momo](https://github.com/shiguredo/momo) 
  - ワンバイナリ
  - とりあえずテストモードで配信
  - [Makefile](webrtc/Makefile)
