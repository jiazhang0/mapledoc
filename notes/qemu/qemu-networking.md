# Qemu networking

Author:  Neil <kai.7.kang@gmail.com>

License: BSD

Update:  Jan 18, 2016

## Networking on VirtualBox

### NAT: Network Address Translation

All packages from VM look like from HOST. It could access HOST network from VM but negtive for the other direction. It is usally allocated ip address for 10.0.x.x.

### HOST-only

It emulates a network adaptor for VM. Just like its name, VM could only communicate with HOST. It is allocated ip address with 192.168.x.x.

### Bridged Adapter

It emulates another machine in HOST network.


## Two parts to networking within QEMU

* the virtual network device that is provided to the guest (e.g. a PCI network card).
* the network backend that interacts with the emulated NIC (e.g. puts packets onto the host's network)

## Creating a network backend

    -netdev TYPE,id=NAME,...

## Network backend types

* SLIRP
* Tap
* VDE
* Socket

### User Networking (SLIRP)

Default backend and it is a NAT.

![](pics/Slirp_concept.png)

**limitations:**

* there is a lot of overhead so the performance is poor
* ICMP traffic does not work (so you cannot use ping within a guest)
* the guest is not directly accessible from the host or the external network


    qemu -m 256 -hda disk.img &
    qemu -m 256 -hda disk.img -net nic -net user &
    qemu-system-i386 -m 256 -hda disk.img -netdev user,id=network0 -device e1000,netdev=network0 &

** The -net option is superceded by -netdev in newer QEMU versions.**

Adding the following to the qemu command line will change the network configuration to use 192.168.76.0/24 instead of the default (10.0.2.0/24) and will start guest DHCP allocation from 9 (instead of 15):

    -netdev user,id=mynet0,net=192.168.76.0/24,dhcpstart=192.168.76.9

### Tap

The tap networking backend makes use of a tap networking device in the host. 

**Advantages:**

* good performance
* can be configured to create virtually any type of network topology

**Disadvantages:**

* configuration are different depending on HOST
* need root privilege


    qemu -m 256 -hda disk.img -net nic -net tap,ifname=tap0,script=no,downscript=no


### Socket

    -netdev socket,id=mynet0,listen=:1234
    -netdev socket,id=mynet0,connect=:1234


## Creating a virtual network device

The e1000 is the default network adapter in qemu. The rtl8139 is the default network adapter in qemu-kvm. ???

    qemu-system-<arch> -net nic,model=?
