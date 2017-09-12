//
//  ViewController.m
//  UIView-AlertView
//
//  Created by ucse on 2017/9/11.
//  Copyright © 2017年 lyt. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AVV_AlertView.h"
#import <BUIBlockUI.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"show alertview" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 0, 200, 50);
    button.center = self.view.center;
    
    __weak typeof(self) weakSelf = self;
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        
        AVV_ButtonItem *okItem = [AVV_ButtonItem itemWithLabel:@"确定" andTextColor:[UIColor redColor] action:^{
            
        }];
        
        AVV_ButtonItem *cancelItem = [AVV_ButtonItem itemWithLabel:@"取消" andTextColor:[UIColor redColor] action:^{
            
        }];
        
        [weakSelf.view showAlertViewWithMessage:@"title" andButtonItems:okItem,cancelItem, nil];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
