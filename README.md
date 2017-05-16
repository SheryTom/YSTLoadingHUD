# YSTLoadingHUD
一个菊花转动的加载提示框，可以自定义。

### UpdateVersion 1.0
1. 添加资源文件、以及源码

### Introduction
<p>1.设置中间视图的样式:</p>
<pre><code>
/**
 设置中间焦点视图的样式
 @param type 样式类型
 */
+ (void) setCenterViewMaskType:(YSTCenterProgressViewStyle) type;
</code></pre>

<p>2.设置圆角半径大小:</p>
<pre><code>
/**
 设置圆角大小
 @param radius 圆角半径
 */
+ (void) setCornerRadius:(CGFloat) radius;
</code></pre>

<p>3.设置成功图片:</p>
<pre><code>
/**
 设置成功图片
 @param successImg 成功图片
 */
+ (void) setSuccessImg:(UIImage *) successImg;
</code></pre>

<p>4.带加载转圈圈的提示框:</p>
<pre><code>
/**
 带加载转圈圈的提示框
 @param status 提示文案
 */
+ (void) showIndicatorWithStatus:(NSString *) status;
</code></pre>

<p>5.警告提示框:</p>
<pre><code>
/**
 警告提示框
 @param status 提示文案
 */
+ (void) showAlertWithStatus:(NSString *) status;
</code></pre>

