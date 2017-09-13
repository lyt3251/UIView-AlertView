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
    button.frame = CGRectMake(100, 200, 200, 50);
//    button.center = self.view.center;
    
    __weak typeof(self) weakSelf = self;
    [button handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        [weakSelf showAlertView];
//        [weakSelf showAlertVC];

    }];
    
}


-(void)showAlertView
{
    AVV_ButtonItem *okItem = [AVV_ButtonItem itemWithLabel:@"确定" andTextColor:[UIColor redColor] action:^{
        
    }];
    
    AVV_ButtonItem *cancelItem = [AVV_ButtonItem itemWithLabel:@"取消" andTextColor:[UIColor redColor] action:^{
        
    }];
    
    AVV_ButtonItem *otherItem = [AVV_ButtonItem itemWithLabel:@"其他" andTextColor:[UIColor redColor] action:^{
        
    }];
    
    
    AVV_AlertViewConfig *config = [AVV_AlertViewConfig sharedInstance];
    config.titleColor = [UIColor redColor];
    
//    [self.view showAlertViewWithMessage:@"title" andButtonItems:okItem, otherItem,cancelItem, nil];
    [self.view showAlertViewWithTitle:@"title" andMessage:@"message messages!!!!!" andButtonItemsArr:@[okItem, cancelItem, otherItem] ];
}

-(void)showAlertVC
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertC animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
