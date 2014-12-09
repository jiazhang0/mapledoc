Build log of qemuarm64 for wrlinux

Create Date: Sep 18, 2014
Last Update:

1 wr-base/recipes-core/eglibc/eglibc-locale_2.19.bb:

Error 1:
ERROR: locale_arch_options not found for target_arch=aarch64
ERROR: Function failed: unknown arch:aarch64 for locale_arch_options

Fix:
add item aarch64 into locale_arch_options in file classes/libc-package.bbclass

Error 2:
| /bin/sh: 1: cross-localedef: not found
| make: *** [/buildarea3/kkang/wrlinux/builds/newbsp-aarch64-Sep17/bitbake_build/tmp/work/aarch64-wrs-linux/eglibc-locale/2.19-r0/locale-tree/usr/lib64/locale/iw_IL.ISO-8859-8] Error 127

Fix:
add dependency cross-localedef-native.


