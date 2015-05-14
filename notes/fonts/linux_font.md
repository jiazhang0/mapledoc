# Linux字体简介

**康凯**

# 字体分类

## 根据字形分类
* 衬线体

  衬线体指的是有衬线的字体，又称为“有衬线体”（中文惯用名称“白体”）。而与之相对的，没有衬线的称为“无衬线体”（中文惯用“黑体”）。衬线指的是字形笔画末端的装饰细节部分。衬线体称为serif，而中文称宋体，香港日本韩国称明体。

  衬线体适用于印刷。

* 无衬线体

  无衬线体称为sans-serif，简称sans. sans来源于法语，没有的意思。中文中无衬线体称为“黑体”。在计算机领域中倾向使用无衬线字体以方便在显示器上显示。

## 根据字符宽度宽度

* 等宽字体

  等宽字体（Monospaced Font）是指字符宽度相同的电脑字体，简写mono。代码中使用的是等宽字体。

* 比例字体 (Proportional Font)

## 字体示例

中文宋体黑体:

![](pics/Hanzi_serif_sans.png)

英文Serif Vs. Sans:

![](pics/sans_serif.png)

![](pics/serif.png)

![](pics/serif_highlight.png)

等宽字体与比例字体：

![](pics/mono_proportional.png)

## 字体技术

+ 矢量字体 

  矢量字体的每个字形都是通过数学方程来描述的，一个字形上分区出若干个关键点，相邻关键点之间由一条光滑曲线连接，这条曲线可以由有限个参数来唯一确定。矢量字的好处是字体可以无级缩放而不会产生变形。矢量字体在显示或者打印出来之前需要进行光栅化。

  - Type1：

    Type1全称PostScript Type1，是1985年由Adobe公司提出的一套矢量字体标准。它是非开放字体。

    Type1使用三次贝塞尔曲线来描述字形。由于字体方程复杂，渲染的时候花费的时间多，所以大部分Type1字体嵌入了点阵字体，这样渲染快，但是边缘不光滑，比较难看。很多ps文档和ps转换的pdf文档都是这样，在计算机上浏览的时候字体很难看，但是打印出来很美观。

  - TrueType:

    TrueType是1991年由Apple公司与Microsoft公司联合提出另一套矢量字标准。

    TrueType则使用二次贝塞尔曲线来描述字形, 所以没有Type1精确美观。

    TrueType字体文件的扩展名是.ttf

  - OpenType:

    OpenType则是Type1与TrueType之争的最终产物。1995年，Adobe公司和Microsoft公司开始联手开发一种兼容Type1和TrueType，并且真正支持Unicode的字体，后来在发布的时候，正式命名为OpenType。OpenType可以嵌入Type1和TrueType，这样就兼有了二者的特点，无论是在屏幕上察看还是打印，质量都非常优秀。

    OpenType文件扩展名为.otf.

    Google和Adobe新发布的思源黑体（Source Han Sans）就是OpenType字体技术。

+ 点阵字体(位图字体）

  点阵字体也叫位图字体，其中每个字形都以一组二维像素信息表示。这种文字显示方式于较早前的电脑系统（例如未有图形接口时的 DOS 操作系统）被普遍采用。由于位图的缘故，点阵字体很难进行缩放，特定的点阵字体只能清晰地显示在相应的字号下，否则文字只被强行放大而有损字形，产生成马赛克式的锯齿边缘。但对于字号 8-14px 的尺寸较小的汉字字体（即现今操作系统大多采用的默认字号）现今亦仍然被使用于荧幕显示上，能够提供更高的显示效果；不过现今该种点阵字体主要只作为“辅助”的部分，当用户设置的字体尺寸并没有拥有位图像时，字体便会以矢量图象方式显示；而当打印时，点阵字体无论大小亦会使用矢量字体打印。

  常见的纯点阵字体有 bdf，pcf，fnt，hbf 等格式。


## linux字体配置

  Fontconfig 是一个为应用程序提供可用字体的程序库，也可用来配置字体渲染效果。绝大部分linux应用程序使用Fontconfig来显示和渲染字体。

### Fontconfig配置文件
  Fontconfig配置文件详细的讲解请参考'man fonts-conf'.

  Fontconfig按照下面的顺序读取配置文件：

  * /etc/fonts/fonts.conf
  * /etc/fonts/fonts.dtd
  * /etc/fonts/conf.d
  * $XDG_CONFIG_HOME/fontconfig/conf.d
  * $XDG_CONFIG_HOME/fontconfig/fonts.conf
  * ~/.fonts.conf.d
  * ~/.fonts.conf

前3项是全局配置，在fontconfig代码中写死的。 后面4项是单个用户的配置, 由配置文件50-user.conf引入的。而“~/.fonts.conf.d”和“~/.fonts.conf”被标记为*deprecated*，可能会在将来移除。如果用户的单独配置和全局配置不同，用户配置会覆盖全局配置。

配置文件使用XML格式并且需要一些格式头:

    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>

      <!-- settings go here -->

    </fontconfig>


#### 预设配置

预设配置文件放在目录/etc/fonts/conf.avail中。当给它们创建符号链接到/etc/fonts/conf.d，这些配置就被激活了。

    # cd /etc/fonts/conf.d
    # ln -s ../conf.avail/10-sub-pixel-rgb.conf
  
Fontconfig以数字顺序加载/etc/fonts/conf.d下的已[0-9][0-9]*.conf形式命名的配置文件。

默认的配置文件名字规则:

     Files begining with:   Contain:

     00 through 09          Font directories
     10 through 19          system rendering defaults (AA, etc)
     20 through 29          font rendering options
     30 through 39          family substitution
     40 through 49          generic identification, map family->generic
     50 through 59          alternate config file loading
     60 through 69          generic aliases, map generic->family
     70 through 79          select font (adjust which fonts are available)
     80 through 89          match target="scan" (modify scanned patterns)
     90 through 99          font synthesis

#### 反锯齿

  反锯齿（anti-aliasing，简称AA）， 它是一种消除显示器输出的画面中图物边缘出现凹凸锯齿的技术。字体光栅化将矢量字体数据转化为位图数据以显示在屏幕上． 最后的效果可能由于走样会出现锯齿。反锯齿默认被打开，这样可以增加字体边缘的分辨率。

     <match target="font">
       <edit name="antialias" mode="assign">
         <bool>true</bool>
       </edit>
     </match>


#### 字体微调

  [字体微调](https://en.wikipedia.org/wiki/Font_hinting)（Font hinting）是利用精确的指令来调整字体显示的轮廓，这样就可以用离散的网格来显示我们需要的线条, 比如说像素网格。由于屏幕的像素有限，向量字型的缩放需要有更多的考虑, 例如当一条线位在两个像素格子中间时, 该取左边的格子还是右边的格子? 如果这方面的控制没有做好，就常常会出现字型的衬线没有对齐，或是小字歪七扭八的情况。Hinting 是额外的信息, 它告诉 renderer 该如何处理这些细节的部份，使得向量字在小字的时候能够好看。

  我们有两种微调的方法可以用:

##### 字节码解释器(BCI)

  当用BCI方法时，TrueType字体里的指令就会被唤醒并用FreeTypes的解释器来渲染，这在自带良好微调指令的字体上工作的很好．

  打开normal hinting: 

    <match target="font">
      <edit name="hinting" mode="assign">
        <bool>true</bool>
      </edit>
    </match>

##### 自动微调器

自动微调器方法就是微调全自动并且忽视任何内嵌的微调指令，起初这种方法是缺省配置的，因为以前的TrueType2字体都是有专利保护限制，没办法用BCI方法微调，但是现在这些专利都已经过期，所以限制也就没有了，当然也就是没有多大意义用自动微调这种方法了。但是它对内嵌微调指令不完整或者干脆没有的字体非常管用，相对的，如果字体自身有良好的微调指令，这种方法就绝对不提倡了。现如今，一般字体都有不错的微调指令，所以自动微调器这种方法就没多大用武之地。

打开自动微调(auto-hinting):

    <match target="font">
      <edit name="autohint" mode="assign">
        <bool>true</bool>
      </edit>
    </match>

##### 微调样式

微调样式就是微调时可以采用的款式，包括hintfull, hintmedium, hintslight 还有 hintnone。至于效果，hintslight可以较好的保持字体的形态但是在像素网格里的排列会有些模糊，hintfull则相反，排列清晰但字体的体态就不慎清楚。所以如果用BCI微调法，就推荐用hintfull，自动微调的话就hintslight了。

    <match target="font">
      <edit name="hintstyle" mode="assign">
        <const>hintfull</const>
      </edit>
    </match>


#### 亚像素渲染(subpixel rendering)

如今生产的显示器大部分用的是红绿蓝（RGB）规范，也有用BGR, V-RGB (vertical), 或者 V-BGR规范的（具体什么类型可以[这里](http://www.lagom.nl/lcd-test/subpixel.php#subpixel.png)查看）。为了正确显示字体，Fontconfig得知道你的显示器具体类型。

打开亚像素渲染:

    <match target="font">
      <edit name="rgba" mode="assign">
        <const>rgb</const>
      </edit>
    </match>

#### 别名

有一些惯用名已经被废弃，但为了向后兼容，增加一些别名。

    <!--
      Accept deprecated 'mono' alias, replacing it with 'monospace'
    -->
    <match target="pattern">
            <test qual="any" name="family">
                    <string>mono</string>
            </test>
            <edit name="family" mode="assign" binding="same">
                    <string>monospace</string>
            </edit>
    </match>

### Fontconfig提供的工具

  * fc-cache
  * fc-list
  * fc-match
  * fc-cat
  * fc-pattern
  * fc-query
  * fc-scan

### 安装字体

  在linux加入一个字体非常简单。以思源黑体为例，在[官网](http://sourceforge.net/projects/source-han-sans.adobe/files/)下载字体文件并解压，假设放在用户主目录下/home/neil/SourceHanSansTWHK.

* 将字体目录写入配置文件

  可以直接修改系统全局配置文件，不过不建议。建议加入一个配置文件到/etc/conf.d或者加入到~/.fonts.conf。

    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <dir>/home/neil/Dropbox/字体/思源黑体</dir>
    </fontconfig>

   抑或将字体目录放入到Fontconfig默认扫描的目录中，默认包括/usr/share/fonts， /usr/local/share/fonts, $XDG_CONFIG_HOME/fontconfig/fonts和~/.fonts。

* 运行fc-cache重新扫描生成cache

  这样新的字体就加入到了系统中。可用fc-list来查验。

* 设置默认字体

  fc-match可以列出系统中默认使用的字体：

      fc-match serif
      fc-match -s sans

  '-s'选项可以按照优先级列出使用的字体。

  参考69-language-selector-zh-tw.conf，设置思源黑体为默认字体

      <match target="pattern">
          <test qual="any" name="family">
              <string>serif</string>
          </test>
              <test name="lang">
                  <string>zh-tw</string>
              </test>
          <edit name="family" mode="prepend" binding="strong">
              <string>Source Han Sans TWHK</string>
          </edit>
      </match>


### 调试 --> FC_DEBUG

         Name         Value    Meaning
         ---------------------------------------------------------
         MATCH            1    Brief information about font matching
         MATCHV           2    Extensive font matching information
         EDIT             4    Monitor match/test/edit execution
         FONTSET          8    Track loading of font information at startup
         CACHE           16    Watch cache files being written
         CACHEV          32    Extensive cache file writing information
         PARSE           64    (no longer in use)
         SCAN           128    Watch font files being scanned to build caches
         SCANV          256    Verbose font file scanning information
         MEMORY         512    Monitor fontconfig memory usage
         CONFIG        1024    Monitor which config files are loaded
         LANGSET       2048    Dump char sets used to construct lang values
         OBJTYPES      4096    Display message when value typechecks fail


# References:

* [思源黑体](https://zh.wikipedia.org/zh-hk/%E6%80%9D%E6%BA%90%E9%BB%91%E9%AB%94)
* [Fontconfig](https://wiki.archlinux.org/index.php/Font_Configuration_%28%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87%29)

