
1 core-image-base
DONE

2 core-image-minimal
DONE

3 core-image-sato
DONE

4 core-image-sato-sdk
DONE

5 world
Summary: 6 tasks failed:
  /buildarea3/kkang/poky/meta/recipes-support/liburcu/liburcu_0.8.4.bb, do_compile
  /buildarea3/kkang/poky/meta/recipes-devtools/guile/guile_2.0.11.bb, do_compile
  /buildarea3/kkang/poky/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb, do_compile
  /buildarea3/kkang/poky/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb, do_compile
  /buildarea3/kkang/poky/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb, do_compile
  /buildarea3/kkang/poky/meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb, do_compile

qt4-embedded: 	without building webkit 
liburcu:	From lttng, Joe fix it
guile:		Joe provides patch
gtk+3:		Joe working on it
xf86-video-omap: 	
cryptoden-module:	kernel config_MODULE did not be set

Update Sep 20:
1 /buildarea3/kkang/poky-test-arm64/meta/recipes-support/libunwind/libunwind_1.1.bb, do_compile
2 /buildarea3/kkang/poky-test-arm64/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb  
