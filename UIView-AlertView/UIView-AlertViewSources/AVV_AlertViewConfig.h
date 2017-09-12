//
//  AVV_AlertViewConfig.h
//  UIView-AlertView
//
//  Created by ucse on 2017/9/12.
//  Copyright © 2017年 lyt. All rights reserved.
//

@import Foundation;
@import CoreGraphics;
@import UIKit;




@interface AVV_AlertViewConfig : NSObject

@property(nonatomic, assign)CGFloat lineHeight;
@property(nonatomic, strong)UIColor *lineColor;

@property(nonatomic, strong)UIColor *alertViewBKColor;


@property(nonatomic, strong)UIColor *titleColor;
@property(nonatomic, strong)UIFont *titleFont;

@property(nonatomic, strong)UIColor *msgColor;
@property(nonatomic, strong)UIColor *msgNoTitleColor;
@property(nonatomic, strong)UIFont *msgFont;

@property(nonatomic, strong)UIColor  *btnNormalColor;
@property(nonatomic, strong)UIFont *btnNormalFont;
@property(nonatomic, strong)UIColor *btnNormalBKColor;


@property(nonatomic, strong)UIColor *btnSelectedColor;
@property(nonatomic, strong)UIFont *btnSelectedFont;
@property(nonatomic, strong)UIColor *btnSelectedBKColor;


+ (instancetype)sharedInstance;


@end
