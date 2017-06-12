//
//  ViewController.m
//  YSTLoadingHUD
//
//  Created by 住梦ios on 2017/5/10.
//  Copyright © 2017年 住梦ios. All rights reserved.
//

#import "ViewController.h"
#import "YSTLoadingHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)show:(UIButton *)sender {
    YSTLoadingIndicatorStyle style = sender.tag;
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
            [YSTLoadingHUD showAlertWithStatus:@"无定位权限，请在设置中手动开启！鼎折覆餗似睡非睡是否是水电费水电费是四川省地方的司法所发生行政村正常大哥大哥是否是是否水电费是否第三帝国飞哥梵蒂冈地方郭德纲司法所发生"];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
