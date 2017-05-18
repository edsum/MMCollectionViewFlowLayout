# MMCollectionViewFlowLayout
一个针对多种业务需求的**UICollectionView** 。
当您从一个项目滚动到另一个项目时，**UICollectionView**没有转换效果。 有很多方法可以为**UICollectionView**编写动画，但使用**UICollectionViewLayout**子类是最简单的一个。 

 - ![Parallax](http://img.blog.csdn.net/20170518220642054?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)  ![Cards](http://img.blog.csdn.net/20170518220941102?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)  ![CrossFade](http://img.blog.csdn.net/20170518221001128?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)   ![Cube](http://img.blog.csdn.net/20170518221027300?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)  ![Page](http://img.blog.csdn.net/20170518221053520?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)  ![RotateInOut](http://img.blog.csdn.net/20170518221110744?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)  ![ZoomInOut](http://img.blog.csdn.net/20170518221132005?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

# 使用方法
* 下载项目到本地：方式一：
	终端输入： $ git clone https://github.com/edsum/MMCollectionViewFlowLayout
	方式二： 如下图
	![这里写图片描述](http://img.blog.csdn.net/20170518145034096?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

* 把 `MMCollectionViewFlowLayout`文件夹拖入项目
![需要的类文件都在这里](http://img.blog.csdn.net/20170518144346523?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvdTAxNDc5NTAyMA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

*  设置你的`UICollectionView`的`collectionViewLayout`，为`MMCollectionViewFlowLayout`，设置`MMCollectionViewFlowLayout`的transition，目前提供了八种动画形式，代码如下：

```
let layout = MMCollectionViewFlowLayout()
layout.transition = ParallaxAttributesTransition()
collectionView.collectionViewLayout = layout
```
# 定制
Transition的实现是基于`MMLayoutProtocol`协议的实现。他们大多数都有额外的参数，您可以调整转换。 你也可以编写自己的动画。

# 期待

* 如果你发现了哪些bug,欢迎及时Issues；
* 作者将不定期更新新的动画模式；
* 如果你有更好玩的可以@Me：ed_sun0129@163.com