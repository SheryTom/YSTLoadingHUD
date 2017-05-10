//
//  YSTLoadingHUD.h
//  YSTLoadingHUD
//
//  Created by 住梦ios on 2017/4/27.
//  Copyright © 2017年 住梦ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSTCenterProgressView.h"

typedef NS_ENUM(NSUInteger, YSTCenterProgressViewStyle) {
    YSTCenterProgressViewStyleNone,
    YSTCenterProgressViewStyleLightGray,
    YSTCenterProgressViewStyleGray,
    YSTCenterProgressViewStyleRed,
    YSTCenterProgressViewStyleBlack,
    YSTCenterProgressViewStyleCustom
};

@interface YSTLoadingHUD : UIView

@property (nonatomic, strong) YSTCenterProgressView *centerView;

/**
 设置中间焦点视图的样式

 @param type 样式类型
 */
+ (void) setCenterViewMaskType:(YSTCenterProgressViewStyle) type;

/**
 设置提示框的前景颜色

 @param color 色值
 */
+ (void) foreignColor:(UIColor *) color;

/**
 设置圆角大小

 @param radius 圆角半径
 */
+ (void) setCornerRadius:(CGFloat) radius;

/**
 设置成功图片

 @param successImg 成功图片
 */
+ (void) setSuccessImg:(UIImage *) successImg;

/**
 设置失败图片

 @param failureImg 失败图片
 */
+ (void) setFailureImg:(UIImage *) failureImg;

/**
 设置警告图片

 @param alertImg 警告图片
 */
+ (void) setAlertImg:(UIImage *) alertImg;

/**
 带加载转圈圈的提示框

 @param status 提示文案
 */
+ (void) showIndicatorWithStatus:(NSString *) status;

/**
 加载成功的提示框

 @param status 提示文案
 */
+ (void) showSuccessWithStatus:(NSString *) status;

/**
 加载失败的提示框

 @param status 提示文案
 */
+ (void) showFailureWithStatus:(NSString *) status;

/**
 警告提示框

 @param status 提示文案
 */
+ (void) showAlertWithStatus:(NSString *) status;

/**
 提示框消失
 */
+ (void) dismiss;

@end
