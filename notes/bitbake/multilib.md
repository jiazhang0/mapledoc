# Open Embedded Multilib #

--------------------------
***Last Update: Nov 10, 2015***

## Configure ##

Multilib is set in configure file such as local.conf by:

    require conf/multilib.conf
    MULTILIBS = "multilib:lib32"
    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

In conf/multilib.conf, it evaluates some VARs such as MULTILIBS and INHERIT.
There is an clause **I don't understand**:

    BBCLASSEXTEND_append = " ${MULTILIBS}"

which will expand to:

    BBCLASSEXTEND_append = " multilib:lib32"

Answer is in bitbake/lib/bb/parse/ast.py, it will set var **BBEXTENDCURR** to "multilib"
and var **BBEXTENDVARIANT** to "lib32".

## Implement ##

In conf/multilib.conf, it defines many variables. The most important one is **MULTILIBS**. It should be something looks like:

    MULTILIBS ??= "multilib:lib32"

And var **MULTILIB_VARIANTS** which I don't quit know what it stands for.

In multilib\_global.bbclass, it updates "PREFERRED_VERSION_" and "PREFERRED_PROVIDER_" with multilib prefix include "virtual/foo". It also deals with kernel, kernel modules and allarch packages for PROVIDES and RPROVIDES.

In multilib.bbclass, it do something special for virtclass include set vars MLPREFIX, PN and OVERRIDES etc. It also has a ananoymous python function to deal PROVIDES, DEPENDS and PACKAGE_INSTALL etc.

There is another import python file *meta/lib/oe/classextend.py* which does the real work to expand/evaluate the real value of vars RDEPENDS/RPROVIDES etc.
