# CoreOS Install
CoreOS 를 설치하기 위한 기본적인 스크립트 입니다.

# Setup
## Git clone
```
$ sudo git clone https://github.com/microcats/coreos.git
```


## Configure
아래의 설명을 참고하여 설정에 맞게 변수의 값을 수정해주세요.

### Option
**HOSTNAME**=hostname

**DNS**=DNS IP Address

**GATEWAY**=Gateway IP Address

**PRIVATE_IPV4**=CoreOS가 설치될 장비의 IP Address

**TIMEZONE**==CoreOS가 시스템 Timezone

**DEVICE**=CoreOS가 설치될 Device (default : /dev/sda)

**CHANNEL**=CoreOS를 설치할 버전 stable, beta, alpha 3가지가 있습니다. (default : stable)


### Configure Example
```
$ cd coreos/default
$ vi config

HOSTNAME="hostname"
DNS=8.8.8.8
GATEWAY=192.168.0.1
PRIVATE_IPV4=192.168.0.10

TIMEZONE=Asia/Seoul
DEVICE="/dev/sda"
CHANNEL=stable

```


## Install
아래의 명령어로 설치해주세요.
```
$ cd coreos/default
$ chmod 755 coreos-install.sh
$ ./coreos-install.sh
```


## Reboot
설치가 완료되면 재부팅해주세요.
```
$ sudo reboot
```
