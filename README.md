# YSTLoadingHUD
一个菊花转动的加载提示框，可以自定义。</br>
![img](http://g.recordit.co/MWJkZqI1CA.gif)
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

### Usage
<p>使用方法很简单，把文件导入到工程中，然后参照下面的用法就可以了。</p>
<pre><code>
//设置圆角半径
[YSTLoadingHUD setCornerRadius:5];
switch (style) {
    case YSTLoadingIndicatorStyle_Progress:
        //带菊花转动的加载样式
        [YSTLoadingHUD showIndicatorWithStatus:@"跳转支付中..."];
        break;
    case YSTLoadingIndicatorStyle_Success:
        //加载成功的样式
        [YSTLoadingHUD showSuccessWithStatus:@"付款成功"];
        break;
    case YSTLoadingIndicatorStyle_Failure:
        //加载失败的样式
        [YSTLoadingHUD showFailureWithStatus:@"付款失败"];
        break;
    case YSTLoadingIndicatorStyle_Alert:
        //警告提示的样式
        [YSTLoadingHUD showAlertWithStatus:@"无定位权限，请在设置中手动开启！"];
        break;
        
    default:
        break;
}
</pre></code>
