Some notes for build and boot qemuarm64 image

Tue Sep 2, 2014

1 configure

The configure process is easy. Just copy configure files from linaro:
https://git.linaro.org/openembedded/meta-linaro.git

2 build

** gcc-runtime:

    checking dynamic linker characteristics... configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.



2 boot

During boot, I met 3 failures:
* can't find the rootfs
* can't get an valid init file
* can not setup network

2.1 
