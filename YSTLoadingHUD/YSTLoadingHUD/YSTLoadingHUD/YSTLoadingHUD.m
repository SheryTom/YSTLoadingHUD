//
//  YSTLoadingHUD.m
//  YSTLoadingHUD
//
//  Created by 住梦ios on 2017/4/27.
//  Copyright © 2017年 住梦ios. All rights reserved.
//

#import "YSTLoadingHUD.h"

#define DefaultBackgroundColor [UIColor grayColor]
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Ratio Screen_Height/Screen_Width//屏幕高/宽

@implementation YSTLoadingHUD

#pragma mark - 单利
+ (YSTLoadingHUD *)sharedView {
    static dispatch_once_t once;
    static YSTLoadingHUD *sharedView;
    dispatch_once(&once, ^{
        sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        sharedView.backgroundColor = DefaultBackgroundColor;
        sharedView.layer.opacity = 0.7;
    });
    return sharedView;
}

+ (void) setCenterViewMaskType:(YSTCenterProgressViewStyle) type{
    switch (type) {
        case YSTCenterProgressViewStyleNone:{
            [self sharedView].centerView.backgroundColor = [UIColor whiteColor];
            break;
        }
        case YSTCenterProgressViewStyleLightGray:{
            [self sharedView].centerView.backgroundColor = [UIColor lightGrayColor];
            break;
        }
        case YSTCenterProgressViewStyleGray:{
            [self sharedView].centerView.backgroundColor = [UIColor grayColor];
            break;
        }
        case YSTCenterProgressViewStyleRed:{
            [self sharedView].centerView.backgroundColor = [UIColor redColor];
            break;
        }
        case YSTCenterProgressViewStyleBlack:{
            [self sharedView].centerView.backgroundColor = [UIColor blackColor];
            break;
        }
        default:{
            break;
        }
    }
}

+ (void) foreignColor:(UIColor *) color{
    [self sharedView].centerView.backgroundColor = color;
}

+ (void) setCornerRadius:(CGFloat) radius{
    [self sharedView].centerView.layer.cornerRadius = radius;
    [self sharedView].centerView.layer.masksToBounds = YES;
}

+ (void) setSuccessImg:(UIImage *) successImg{
    [self sharedView].centerView.staticImgView.image = successImg;
}

+ (void) setFailureImg:(UIImage *) failureImg{
    [self sharedView].centerView.staticImgView.image = failureImg;
}

+ (void) setAlertImg:(UIImage *) alertImg{
    [self sharedView].centerView.staticImgView.image = alertImg;
}

+ (void) showIndicatorWithStatus:(NSString *) status{
    [self setupSubViews];
    [self sharedView].centerView.statusLabel.text = status;
    [self sharedView].centerView.indicatorStyle = YSTLoadingIndicatorStyle_Progress;
    [self reloadCenterView];
}

+ (void) showSuccessWithStatus:(NSString *) status{
    [self setupSubViews];
    [self sharedView].centerView.statusLabel.text = status;
    [self sharedView].centerView.indicatorStyle = YSTLoadingIndicatorStyle_Success;
    [self reloadCenterView];
    [self delayDismiss];
}

+ (void) showFailureWithStatus:(NSString *) status{
    [self setupSubViews];
    [self sharedView].centerView.statusLabel.text = status;
    [self sharedView].centerView.indicatorStyle = YSTLoadingIndicatorStyle_Failure;
    [self reloadCenterView];
    [self delayDismiss];
}

+ (void) showAlertWithStatus:(NSString *) status{
    [self setupSubViews];
    [self sharedView].centerView.statusLabel.text = status;
    [self sharedView].centerView.indicatorStyle = YSTLoadingIndicatorStyle_Alert;
    [self reloadCenterView];
    [self delayDismiss];
}

+ (void) reloadCenterView{
    NSString *value = [self sharedView].centerView.statusLabel.text;
    CGRect labelRect = [self sharedView].centerView.statusLabel.frame;
    CGFloat originalHeight = labelRect.size.height;
    CGSize textSize = [value boundingRectWithSize:CGSizeMake(labelRect.size.width, CGFLOAT_MAX)
                                          options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[self sharedView].centerView.statusLabel.font}
                                          context:nil].size;
    labelRect.size.height = textSize.height;
    [self sharedView].centerView.statusLabel.frame = labelRect;
    
    CGRect centerViewRect = [self sharedView].centerView.frame;
    centerViewRect.size.height = centerViewRect.size.height + (labelRect.size.height - originalHeight);
    [self sharedView].centerView.frame = centerViewRect;
}

+ (void) setupSubViews{
    [[self sharedView] removeFromSuperview];
    [[self sharedView].centerView removeFromSuperview];
    
//    if (![self sharedView].superview) {
//        NSArray *frontToBackWindows = [[UIApplication.sharedApplication.windows reverseObjectEnumerator] allObjects];
//        for (UIWindow *itemWindow in frontToBackWindows) {
//            BOOL windowOnMainScreen = itemWindow.screen == [UIScreen mainScreen];
//            BOOL windowIsVisible = !itemWindow.hidden && itemWindow.alpha > 0;
//            BOOL windowLevelNormal = itemWindow.windowLevel == UIWindowLevelNormal;
//            if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
//                [itemWindow addSubview:[self sharedView]];
//                break;
//            }
//        }
//    }else{
//        [[self sharedView].superview bringSubviewToFront:[self sharedView]];
//    }
    
//    [[[UIApplication sharedApplication] delegate].window addSubview:[self sharedView]];
//    [[[UIApplication sharedApplication] delegate].window addSubview:[self sharedView].centerView];
    
    [[UIApplication sharedApplication].keyWindow addSubview:[self sharedView]];
    [[UIApplication sharedApplication].keyWindow addSubview:[self sharedView].centerView];
}

+ (void) dismiss{
    if ([self sharedView].centerView.superview) {
        [[self sharedView].centerView reductCircleView];
    }
    [[self sharedView] removeFromSuperview];
    [[self sharedView].centerView removeFromSuperview];
}

+ (void) delayDismiss{
    if ([self sharedView].centerView.superview) {
        [[self sharedView].centerView reductCircleView];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[self sharedView] removeFromSuperview];
        [[self sharedView].centerView removeFromSuperview];
    });
}

#pragma mark - 懒加载
- (YSTCenterProgressView *)centerView{
    if (!_centerView) {
        _centerView = [[YSTCenterProgressView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width * 2 / 5, 80) indicatorStyle:YSTLoadingIndicatorStyle_Default];
        _centerView.center = self.center;
    }
    return _centerView;
}

@end