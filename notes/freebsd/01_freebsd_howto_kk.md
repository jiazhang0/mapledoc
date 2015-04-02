# FreeBSD KK Howto #

## 设置镜像 ##
忘记在哪里看到的了，设置

   cat /etc/pkg/FreeBSD.conf 

# $FreeBSD: release/10.0.0/etc/pkg/FreeBSD.conf 258710 2013-11-28 14:24:26Z gjb $
FreeBSD: {
  url: "pkg+http://pkg.tw.FreeBSD.org/${ABI}/latest",
  mirror_type: "srv",
  signature_type: "fingerprints",
  fingerprints: "/usr/share/keys/pkg",
  enabled: yes
}


## 设置控制台的分辨率 ##

内核加入
option VESA
option SC_PIXEL_MODE
重新编译kernel

vidcontrol -i mode   #察看系统支持的显示模式
vidcontrol MODE_数字  #设置需要的模式
如:1024x768x32模式
vidcontrol MODE_321
试验成功后，再加入rc.conf  #有些显示模式不能正常工作
vi /etc/rc.conf
加入
allscreens_flags="MODE_数字"

