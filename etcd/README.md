# CoreOS etcd2 Cluster
ectd2 key/value store 서버를 구성하기 위한 CoreOS 설정파일입니다.

# Setup
## Git clone
```
$ sudo git clone https://github.com/microcats/coreos.git
```


## Configure
DNS 및 GATEWAY, 클러스터로 구성할 아이피 및 클러스터 이름을 지정해주세요.

클러스터는 기본으로 3대로 시작합니다.

아래의 설정을 참고해주세요.

### Option
**HOSTNAME**=hostname

**DNS**=DNS IP Address

**GATEWAY**=Gateway IP Address

**PRIVATE_IPV4**=CoreOS가 설치될 장비의 IP Address

**CLUSTER0_IPV4**=Cluster Node 첫번째 장비의 IP Address

**CLUSTER1_IPV4**=Cluster Node 두번째 장비의 IP Address

**CLUSTER2_IPV4**=Cluster Node 세번째 장비의 IP Address

**CLUSTER_TOKEN**=Etcd Cluster를 구성하기위한 Token

**CLUSTER_NAME**=CoreOS가 설치될 Cluster 이름

**CLUSTER0_NAME**=Cluster Node 첫번째 장비의 이름

**CLUSTER1_NAME**=Cluster Node 두번째 장비의 이름

**CLUSTER2_NAME**=Cluster Node 세번째 장비의 이름

**TIMEZONE**==CoreOS가 시스템 Timezone

**DEVICE**=CoreOS가 설치될 Device (default : /dev/sda)

**CHANNEL**=CoreOS를 설치할 버전 stable, beta, alpha 3가지가 있습니다. (default : stable)

### Cluster Configure Example
```
$ cd coreos/etcd
$ vi config

DNS=8.8.8.8
GATEWAY=192.168.0.1

PRIVATE_IPV4=192.168.0.12
CLUSTER0_IPV4=192.168.0.12
CLUSTER1_IPV4=192.168.0.13
CLUSTER2_IPV4=192.168.0.13

CLUSTER_TOKEN=etcd
CLUSTER_NAME=etcd2-cluster0
CLUSTER0_NAME=etcd2-cluster0
CLUSTER1_NAME=etcd2-cluster1
CLUSTER2_NAME=etcd2-cluster2

TIMEZONE=Asia/Seoul
DEVICE="/dev/sda"
CHANNEL=stable
```

## Install
아래의 명령어로 설치해주세요.
```
$ cd coreos/etcd
$ chmod 755 coreos-install.sh
$ ./coreos-install.sh
```


## Reboot
설치가 완료되면 재부팅해주세요.
```
$ sudo reboot
```
