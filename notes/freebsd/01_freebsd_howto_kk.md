# FreeBSD KK Howto #

## ���þ��� ##
���������￴�����ˣ�����

   cat /etc/pkg/FreeBSD.conf 

# $FreeBSD: release/10.0.0/etc/pkg/FreeBSD.conf 258710 2013-11-28 14:24:26Z gjb $
FreeBSD: {
  url: "pkg+http://pkg.tw.FreeBSD.org/${ABI}/latest",
  mirror_type: "srv",
  signature_type: "fingerprints",
  fingerprints: "/usr/share/keys/pkg",
  enabled: yes
}


## ���ÿ���̨�ķֱ��� ##

�ں˼���
option VESA
option SC_PIXEL_MODE
���±���kernel

vidcontrol -i mode   #�쿴ϵͳ֧�ֵ���ʾģʽ
vidcontrol MODE_����  #������Ҫ��ģʽ
��:1024x768x32ģʽ
vidcontrol MODE_321
����ɹ����ټ���rc.conf  #��Щ��ʾģʽ������������
vi /etc/rc.conf
����
allscreens_flags="MODE_����"

