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
    [YSTLoadingHUD setCornerRadius:5];
    switch (style) {
        case YSTLoadingIndicatorStyle_Progress:
            [YSTLoadingHUD showIndicatorWithStatus:@"加载中..."];
            break;
        case YSTLoadingIndicatorStyle_Success:
            [YSTLoadingHUD showSuccessWithStatus:@"加载成功"];
            break;
        case YSTLoadingIndicatorStyle_Failure:
            [YSTLoadingHUD showFailureWithStatus:@"加载失败"];
            break;
        case YSTLoadingIndicatorStyle_Alert:
            [YSTLoadingHUD showAlertWithStatus:@"请输入密码"];
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
