# Howto add simple udev rules

parrotriver <freeordie.k@gmail.com>
Dec 22, 2015

# udevadm options

    $ udevadm --help
    Usage: udevadm [--help] [--version] [--debug] COMMAND [COMMAND OPTIONS]
      info         query sysfs or the udev database
      trigger      request events from the kernel
      settle       wait for the event queue to finish
      control      control the udev daemon
      monitor      listen to kernel and udev events
      hwdb         maintain the hardware database index
      test         test an event run
      test-builtin test a built-in command


# udev rule files

## Directories

    /etc/udev/rules.d
    /lib/udev/rules.d

All rules files are collectively sorted and processed in lexical order,
regardless of the directories in which they live.

But

* same name rules file in /etc/udev/rules.d has higher priority
* rules file name must end with .rules
* rules file starts with numbers are processed first, name with all letters are the last


## Relationship between udev and dbus

In the past a common way to use udev on Linux systems was to let it send events
through a socket to HAL, which would perform further device-specific actions.
For example, HAL would notify other software running on the system that the new
hardware had arrived by issuing a broadcast message on the D-Bus IPC system to
all interested processes.

By the middle of 2011 HAL had been deprecated by most Linux distributions. The
functionality previously embodied in HAL has been integrated into udev itself,
or moved to separate software such as **udisks** and **upower**.

[udev on Wikipedia](https://en.wikipedia.org/wiki/Udev)

## Use case to add a simple rule

Just take my iPhone as example.

Run monitor first:

    udevadm monitor

When plugin in iPhone, it outputs:

    KERNEL[2501958.809582] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8 (usb)
    KERNEL[2501958.810494] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:1.0 (usb)
    KERNEL[2501958.816515] remove   /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:1.0 (usb)
    KERNEL[2501958.817997] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:4.0 (usb)
    KERNEL[2501958.818374] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:4.1 (usb)
    KERNEL[2501958.818435] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:4.2 (usb)
    UDEV  [2501959.044783] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8 (usb)
    UDEV  [2501959.046351] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:4.0 (usb)
    UDEV  [2501959.046393] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:4.1 (usb)
    UDEV  [2501959.046420] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:1.0 (usb)
    UDEV  [2501959.046745] remove   /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:1.0 (usb)
    UDEV  [2501959.047050] add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8/2-1.8:4.2 (usb)

Then call udevadm info to get all info of the iPhone:

    udevadm info --path=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8
    udevadm info /sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.8

Then it outputs all the udev info of iPhone. Cherrypick one typical envirnment
value, then create one rules file in either /etc/udev/rules.d or /lib/udev/rules.d:

**iphone.rules**

    SUBSYSTEM=="usb", ACTION=="add", ENV{ID_MODEL}=="iPhone", RUN+="/usr/bin/touch /tmp/kk" 
    SUBSYSTEM=="usb", ACTION=="remove", ENV{ID_MODEL}=="iPhone", RUN+="/bin/rm -f /tmp/kk"

Then when plugin my iphone, /tmp/kk is created. And will be deleted when unplug iphone.
