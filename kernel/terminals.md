# Terminals

Original date: Thu Jun 19 2014

In kernel Documents/devices.txt, terminal or TTY devices includes:

- virtual consoles: /dev/tty#
- serial ports
- pseudoterminals (PTYs)

**What differences between "virtual consoles" and pseudoterminals?**

## virtual consoles
- full-screen terminal displays on the system video monitor
- name with /dev/tty#. tty0 means current tty
- /dev/console: the device to which system messages should be sent

## serial ports
- /dev/ttyX#: X --> S

## pseudoterminals
- used to create login sessions
- /dev/ptmx: all the masters
- /dev/pts/#: slaves

## manuals
- man 4 pts
- man 7 pty
