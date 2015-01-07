# Linux HA Introduction 

** Kai Kang <kai.kang@windriver.com> **


## 什么是集群？
集群是一组相互独立的、通过高速网络互联的计算机，它们构成了一个组，并以单一系统的模式加以管理。一个客户与集群相互作用时，集群像是一个独立的服务器。集群配置是用于提高可用性和可缩放性。

其目的是为了实现将多台计算机组合以来完成特定的任务，比如天气预报，大型网络游戏，这些都需要很大的运算量，单台计算机实现成本太高，而且不现实。那么就需要通过集群的方式，将废弃的或者正在使用的计算机联合起来，结合整体的力量来解决这些问题。


### 主要优点
- 高可扩展性：
- 高可用性：集群中的一个节点失效，它的任务可以传递给其他节点。可以有效防止单点失效。
- 高性能：负载平衡集群允许系统同时接入更多的用户。
- 高性价比：可以采用廉价的符合工业标准的硬件构造高性能的系统。

### 集群类型 
1. LB Load Balancing（负载均衡集群）
2. HA High Availability（高可用性集群）
3. HP High Performance（高性能集群）


#### 负载均衡集群
负载均衡集群为企业需求提供了更实用的系统。如名称所暗示的，该系统使负载可以在计算机集群中尽可能平均地分摊处理。该负载可能是需要均衡的应用程序处理负载或网络流量负载。这样的系统非常适合于运行同一组应用程序的大量用户。每个节点都可以处理一部分负载，并且可以在节点之间动态分配负载，以实现平衡。对于网络流量也是如此。通常，网络服务器应用程序接受了太多入网流量，以致无法迅速处理，这就需要将流量发送给在其它节点上运行的网络服务器应用。还可以根据每个节点上不同的可用资源或网络的特殊环境来进行优化。

##### 基本原理
用户通过互联网访问到某个网站时，前端的Load Balancer（类似负载均衡器）根据不同的算法或某种特定的方式，将请求转发到后端真正的服务器（节点），后台多台服务器共同分担整个网站的压力。后台的某个节点如果有宕机，其他节点也可以提供服务，从而维持整个网站的正常运行。

![](pics/load_balancing.jpg)

##### 实现方式：
- 硬件：负载均衡设备
- 软件：LVS(Linux Virtual Server), 中国的章文嵩博士发起和领导的


#### 高可用性集群
高可用集群，英文原文为High Availability Cluster，简称HA Cluster，是指以减少服务中断（如因服务器宕机等引起的服务中断）时间为目的的服务器集群技术。简单的说，集群（cluster）就是一组计算机，它们作为一个整体向用户提供一组网络资源。这些单个的计算机系统就是集群的节点（node）。

高可用集群的出现是为了使集群的整体服务尽可能可用，从而减少由计算机硬件和软件易错性所带来的损失。它通过保护用户的业务程序对外不间断提供的服务，把因软件/硬件/人为造成的故障对业务的影响降低到最小程度。如果某个节点失效，它的备援节点将在几秒钟的时间内接管它的职责。因此，对于用户而言，集群永远不会停机。高可用集群软件的主要作用就是实现故障检查和业务切换的自动化。

只有两个节点的高可用集群又称为双机热备，即使用两台服务器互相备份。当一台服务器出现故障时，可由另一台服务器承担服务任务，从而在不需要人工干预的情况下，自动保证系统能持续对外提供服务。双机热备只是高可用集群的一种，高可用集群系统更可以支持两个以上的节点，提供比双机热备更多、更高级的功能，更能满足用户不断出现的需求变化。


#### 高性能集群
这种集群一般企业或者个人很少应用到，高性能计算群集HPC。它可以解决世界上最为复杂和艰巨的计算难题，并且能够轻松处理。在气象建模、模拟撞车试验、人体基因绘图以及核爆炸模拟等多种与人类生命相关的重要领域都要用到HPC。



## 高可用性集群(HA)构建

Linux集群系统包括集群节点和集群管理器两部分。集群节点有时简称为节点、服务器或服务器节点，是提供处理资源的系统，它进行集群的实际工作。一般来讲，它必须进行配置才能成为集群的一部分，也必须运行集群的应用软件。应用软件可以是专用于集群的软件，也可以是设计用于分布式系统的标准软件。Linux集群管理器则是将节点捆绑在一起，以构成单一系统外观的逻辑结构，它用于将任务分解到所有的节点。

### Linux平台解决方案

#### 开放源代码的 HA 项目 
linux-HA 项目历史悠久, 项目主页http://www.linux-ha.org/。很多linux 发行附带的HA集群都是采用了linux-HA 的heartbeat系统和相关的组件。需要构建完全的开源，自由而且免费的高可用集群的用户可以选择。

#### RedHat公司的开放源代码RedHat Cluster Suite(RHCS)
- RHCS实际上是一个套件，除了现在提到的高可用集群软件，还包含了一个基于LVS的负载均衡软件.
- RHCS包含的集群软件，是GPL协议下开放源代码的集群系统. 
- RHCS是一个独立的产品，不包括在RedHat Enterprise Linux当中，无论是购买还是下载，都是单独存在的.（其实就是heartbeat的改进版，改个名，加入了些东西）

#### SuSE公司的开放源代码高可用集群HA套件

SuSE企业版Linux带有一套开放源代码的HA集群软件，包括HA project的heartbeat, heartbeat-ldirectord, heartbeat-pils, heartbeat-stonith, 集群关联的存储软件drbd, 虚拟IP的 src_vipa软件。和RHCS不同的是，SuSE/Novell 企业版Linux自带的HA集群软件并非一个独立的软件，如上介绍，而是由不同的开放源代码项目提供的不同部分的程序。

#### Novell 公司的Novell Cluster Service

Novell收购SuSE之后，将Novell netware上的Novell Cluster Service整合移植到了Linux平台。Novell Cluster Service是一个商业系统，并非开放源代码产品。细节可以参考[Novell Open Enterprise Server 2](http://www.novell.com/products/openenterpriseserver/ncs.html)。


### 以linux-HA构建高可用集群

#### linux-HA架构 

两种方式构建linux-ha
- pacemaker + corosync
- pacemaker + heartbeat

##### pacemaker
   pacemaker(心脏起搏器)，是一个群集资源管理器。它实现最大可用性群集服务（亦称资源管理）的节点和资源级故障检测和恢复使用您的首选集群基础设施（OpenAIS的或Heaerbeat）提供的消息和成员能力。
   它可以做乎任何规模的集群，并配备了一个强大的依赖模型，使管理员能够准确地表达群集资源之间的关系（包括顺序和位置）。几乎任何可以编写脚本，可以管理作为心脏起搏器集群的一部分。

![](pics/pacemaker_internal.png)

###### 群集组件说明

- stonithd：心跳系统。
- lrmd：本地资源管理守护进程。它提供了一个通用的接口支持的资源类型。直接调用资源代理（脚本）。
- pengine：政策引擎。根据当前状态和配置集群计算的下一个状态。产生一个过渡图，包含行动和依赖关系的列表。
- CIB：群集信息库。包含所有群集选项，节点，资源，他们彼此之间的关系和现状的定义。同步更新到所有群集节点。
- CRMD：集群资源管理守护进程。主要是消息代理的PEngine和LRM，还选举一个领导者（DC）统筹活动（包括启动/停止资源）的集群。
- Heartbeat：心跳消息层，OpenAIS的一种替代。
- CCM：共识群集成员，心跳成员层。

###### 功能概述
   CIB使用XML表示集群的集群中的所有资源的配置和当前状态。CIB的内容会被自动在整个集群中同步，使用PEngine计算集群的理想状态，生成指令列表，然后输送到DC（指定协调员）。Pacemaker 集群中所有节点选举的DC节点作为主决策节点。如果当选DC节点宕机，它会在所有的节点上， 迅速建立一个新的DC。DC将PEngine生成的策略，传递给其他节点上的LRMd（本地资源管理守护程序）或CRMD通过集群消息传递基础结构。当集群中有节点宕机，PEngine重新计算的理想策略。在某些情况下，可能有必要关闭节点，以保护共享数据或完整的资源回收。为此，Pacemaker配备了stonithd设备。STONITH可以将其它节点“爆头”，通常是实现与远程电源开关。Pacemaker会将STONITH设备，配置为资源保存在CIB中，使他们可以更容易地监测资源失败或宕机。


##### corosync
##### 由来
要说明corosync的由来，首先我们得从AIS说起，然后说明OpenAIS，最后才会说到corosync。

  应用接口规范（AIS）是用来定义应用程序接口（API）的开放性规范的集合，这些应用程序作为中间件为应用服务提供一种开放、高移植性的程序接口。是在实现高可用应用过程中是亟需的。服务可用性论坛（SA Forum）是一个开放性论坛，它开发并发布这些免费规范。使用AIS规范的应用程序接口（API），可以减少应用程序的复杂性和缩短应用程序的开发时间，这些规范的主要目的就是为了提高中间组件可移植性和应用程序的高可用性。SAF AIS是一个开放性工程，在不断更新中。

  OpenAIS是基于SA Forum标准的集群框架的应用程序接口规范。OpenAIS提供一种集群模式，这个模式包括集群框架，集群成员管理，通信方式，集群监测等，能够为集群软件或工具提供满足 AIS标准的集群接口，但是它没有集群资源管理功能，不能独立形成一个集群。OpenAIS组件包括AMF,CLM,CKPT,EVT,LCK,MSG，TMR,CPG,EVS等，因OpenAIS分支不同，组件略有不同。

  OpenAIS主要包含三个分支：Picacho，Whitetank，Wilson。Wilson是最新的，比较稳定的版本是从openais 1.0.0到openais 1.1.4。Whitetank现在是主流分支版本，比较稳定的版本是openais0.80到openais0.86。Picacho第一代的OpenAIS的分支，比较稳定的版本是openais0.70和openais0.71。现在比较常用的是Whitetank和Wilson，两者之间有很多不同。OpenAIS从Whitetank升级到Wilson版本后，组件变化很大，Wilson把Openais核心架构组件独立出来放在Corosync（Corosync是一个集群管理引擎）里面。Whitetank包含的组件有AMF，CLM，CKPT，EVT，LCK ,MSG, CPG，CFG,EVS, aisparser, VSF_ykd，bojdb等。而Wilson只含有AMF，CLM，CKPT，LCK, MSG,EVT,TMR（TMR，Whitetank里面没有），这些都是AIS组件。其他核心组件被放到了Corosync内。Wilson被当做Corosync的一个插件。(详细请查看官方文档)

  Corosync是OpenAIS发展到Wilson版本后衍生出来的开放性集群引擎工程。可以说Corosync是OpenAIS工程的一部分。OpenAIS从openais0.90开始独立成两部分，一个是Corosync；另一个是AIS标准接口Wilson。Corosync包含OpenAIS的核心框架用来对Wilson的标准接口的使用、管理。它为商用的或开源性的集群提供集群执行框架。Corosync执行高可用应用程序的通信组系统，它有以下特征：

- 一个封闭的程序组（A closed process group communication model）通信模式，这个模式提供一种虚拟的同步方式来保证能够复制服务器的状态。
- 一个简单可用性管理组件（A simple availability manager），这个管理组件可以重新启动应用程序的进程当它失败后。
- 一个配置和内存数据的统计（A configuration and statistics in-memory database），内存数据能够被设置，回复，接受通知的更改信息。
- 一个定额的系统（A quorum  syste）,定额完成或者丢失时通知应用程序。


##### Steps to build an HA
借助一个virtualbox的虚拟机，和主机组成两个节点的集群。

primary node:
	hostname: ha1-ubuntu
	IP: 128.224.162.160

secondary node:
	hostname: pek-kkang-d1
	IP: 128.224.162.231


###### 各节点之间主机名互相解析
On ha1-ubuntu:
root@ha1-ubuntu:~# echo "128.224.162.231 pek-kkang-d1" >> /etc/hosts

On ha2-f21:
[root@localhost ~]# echo "128.224.163.169 ha1-ubuntu ha1-ubuntu" >> /etc/hosts

###### 同步时间
    # ntpdate cn.pool.ntp.org

###### ssh互通
On ha1-ubuntu:

    root@ha1-ubuntu:~# ssh-keygen
    root@ha1-ubuntu:~# ssh-copy-id -i .ssh/id_rsa.pub root@pek-kkang-d1

On pek-kkang-d1

    [root@localhost ~]# ssh-keygen
    [root@localhost ~]# ssh-copy-id -i .ssh/id_rsa.pub root@ha1-ubuntu

###### 配置corosync
将corosync.conf.example拷贝为默认配置文件/etc/corosync/corosync.conf
- 将totem:interface的bindnetaddr字段修改为所在网段。
- 配置logging部分：
      logging {
        ...
        to_logfile: yes
        logfile: /var/log/corosync/corosync.log
      }

- 启用pacemaker:

      service { 
        ver: 1  
        name: pacemaker  
      }

###### 启动corosync和pacemaker
On ha1-ubuntu:

    root@ha1-ubuntu:~# corosync
    # check output in log file
    root@ha1-ubuntu:~# grep -e "corosync.*network interface" -e "Corosync Cluster Engine" /var/log/corosync/corosync.log
    root@ha1-ubuntu:~# grep "TOTEM" /var/log/corosync/corosync.log
    # start pacemaker
    root@ha1-ubuntu:~# service pacemaker start

在pek-kkang-d1上一样的设置。

On ha1-ubuntu:

    # check nodes online
    root@ha1-ubuntu:~# crm_mon
    ...
    Current DC: ha1-ubuntu (14721961) - partition with quorum
    Version: 1.1.10-42f2063
    2 Nodes configured
    0 Resources configured
    
    
    Online: [ ha1-ubuntu pek-kkang-d1 ]
    

###### 准备http服务
    root@ha1-ubuntu:~# apt-get install apache2

    
##### crm shell
crm shell自pacemake中分离出来，在ubuntu中由crmsh提供。

+ 查看一下默认配置

      root@ha1-ubuntu:~# crm
      crm(live)# status 
      Last updated: Fri Dec 12 06:42:04 2014
      Last change: Fri Dec 12 06:38:09 2014 via crmd on pek-kkang-d1
      Stack: corosync
      Current DC: pek-kkang-d1 (14721767) - partition with quorum
      Version: 1.1.10-42f2063
      2 Nodes configured
      0 Resources configured
      
      Online: [ ha1-ubuntu pek-kkang-d1 ]
      crm(live)# 

+ 检测一下配置文件是否有错

      crm(live)# configure 
      crm(live)configure# verify 
         error: unpack_resources: 	Resource start-up disabled since no STONITH resources have been defined
         error: unpack_resources: 	Either configure some or disable STONITH with the stonith-enabled option
         error: unpack_resources: 	NOTE: Clusters with shared data need STONITH to ensure data integrity
      Errors found during check: config not valid
      # STONITH resources 没有定义。我们没有这个设备，关闭这个属性
      crm(live)configure# property stonith-enabled=false
      crm(live)configure# show
      node $id="14721767" pek-kkang-d1
      node $id="14721961" ha1-ubuntu
      property $id="cib-bootstrap-options" \
      	dc-version="1.1.10-42f2063" \
      	cluster-infrastructure="corosync" \
      	stonith-enabled="false"
      crm(live)configure# verify 
      crm(live)configure# 

+ 查看当前集群系统所支持的类型

      crm(live)# ra
      crm(live)ra# classes
      lsb
      ocf / heartbeat pacemaker redhat
      service
      Hstonith
      upstart
      crm(live)ra# 

+ 查看某种类别下的所用资源代理的列表

      crm(live)ra# list lsb
      acpid                  anacron                apache2                apparmor               apport
      avahi-daemon           bluetooth              brltty                 console-setup          corosync
      corosync-notifyd       cron                   cups                   cups-browsed           dbus
      dns-clean              friendly-recovery      grub-common            halt                   irqbalance
      kerneloops             killprocs              kmod                   lightdm                logd
      networking             ondemand               openhpid               pacemaker              pppd-dns
      procps                 pulseaudio             rc                     rc.local               rcS
      reboot                 resolvconf             rsync                  rsyslog                saned
      sendsigs               single                 speech-dispatcher      ssh                    sudo
      udev                   umountfs               umountnfs.sh           umountroot             unattended-upgrades
      urandom                vboxadd                vboxadd-service        vboxadd-x11            x11-common
      crm(live)ra# list ocf pacemaker
      ClusterMon    Dummy         HealthCPU     HealthSMART   Stateful      SysInfo       SystemHealth  controld
      o2cb          ping          pingd 

+ 查看某个资源代理的配置方法

      crm(live)ra# info lsb:corosync
      corosync cluster framework (lsb:corosync)
      
      corosync
      
      Operations' defaults (advisory minimum):
      
          start         timeout=15
          stop          timeout=15
          status        timeout=15
          restart       timeout=15
          force-reload  timeout=15
          monitor       timeout=15 interval=15

+ 创建一个IP地址资源

      crm(live)# configure 
      crm(live)configure# primitive  
      usage: primitive <rsc> {[<class>:[<provider>:]]<type>|@<template>} 
              [params <param>=<value> [<param>=<value>...]] 
              [meta <attribute>=<value> [<attribute>=<value>...]] 
              [utilization <attribute>=<value> [<attribute>=<value>...]] 
              [operations id_spec 
                  [op op_type [<attribute>=<value>...] ...]]
      crm(live)configure# primitive vip ocf:heartbeat:IPaddr params ip=128.224.162.17 nic=eth0 cidr_netmask=23
      crm(live)configure# show 
      node $id="14721552" ha1-ubuntu
      node $id="14721767" pek-kkang-d1
      node $id="14721961" ha1-ubuntu
      primitive vip ocf:heartbeat:IPaddr \
      	params ip="128.224.162.17" nic="eth0" cidr_netmask="23"
      property $id="cib-bootstrap-options" \
      	dc-version="1.1.10-42f2063" \
      	cluster-infrastructure="corosync"
      crm(live)configure# verify
      crm(live)configure# commit

此时打开http://128.224.162.17，显示的是虚拟机ha1-ubuntu. 停掉corosync后，http://128.224.162.17应指向pek-kkang-d1。

      root@pek-kkang-d1:~# crm status
      Last updated: Fri Dec 12 08:27:13 2014
      Last change: Fri Dec 12 08:19:17 2014 via cibadmin on ha1-ubuntu
      Stack: corosync
      Current DC: pek-kkang-d1 (14721767) - partition WITHOUT quorum
      Version: 1.1.10-42f2063
      3 Nodes configured
      1 Resources configured
      
      
      Online: [ pek-kkang-d1 ]
      OFFLINE: [ ha1-ubuntu ha1-ubuntu ]
      root@pek-kkang-d1:~# crm status
      Last updated: Fri Dec 12 08:27:13 2014
      Last change: Fri Dec 12 08:19:17 2014 via cibadmin on ha1-ubuntu
      Stack: corosync
      Current DC: pek-kkang-d1 (14721767) - partition WITHOUT quorum
      Version: 1.1.10-42f2063
      3 Nodes configured
      1 Resources configured
      
      
      Online: [ pek-kkang-d1 ]
      OFFLINE: [ ha1-ubuntu ha1-ubuntu ]

**但是设置并未生效**。这是因为此时的集群状态为"WITHOUT quorum"(红色标记)，即已经失去了quorum，此时集群服务本身已经不满足正常运行的条件，这对于只有两节点的集群来讲是不合理的。因此，我们可以通过如下的命令来修改忽略quorum不能满足的集群状态检查：property no-quorum-policy=ignore

      crm(live)# configure 
      crm(live)configure# property no-quorum-policy=ignore
      crm(live)configure# verify 
      crm(live)configure# commit

片刻便可看到http://128.224.162.17指向到pek-kkang-d1。

##### 其他
还有其他设置如资源黏性等，可以参考man手册。

