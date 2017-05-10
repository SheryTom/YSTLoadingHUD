//
//  YSTCenterProgressView.h
//  YSTLoadingHUD
//
//  Created by 住梦ios on 2017/4/27.
//  Copyright © 2017年 住梦ios. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *kDefaultAlertImgName = @"警告-hotel";
static NSString *kDefaultSuccessImgName = @"成功-hotel";
static NSString *kDefaultFailureImgName = @"失败-hotel";

typedef NS_ENUM(NSUInteger, YSTLoadingIndicatorStyle) {
    YSTLoadingIndicatorStyle_Progress,
    YSTLoadingIndicatorStyle_Success,
    YSTLoadingIndicatorStyle_Failure,
    YSTLoadingIndicatorStyle_Alert,
    YSTLoadingIndicatorStyle_Default
};

@interface YSTCenterProgressView : UIView

@property (nonatomic, strong) UIImageView *staticImgView;

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@property (nonatomic, strong) UILabel *statusLabel;

@property (nonatomic, assign) YSTLoadingIndicatorStyle indicatorStyle;

- (instancetype) initWithFrame:(CGRect)frame indicatorStyle:(YSTLoadingIndicatorStyle) style;

/**
 还原菊花frame
 */
- (void) reductCircleView;

@end
