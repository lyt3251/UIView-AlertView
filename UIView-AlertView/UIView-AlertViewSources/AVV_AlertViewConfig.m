//
//  AVV_AlertViewConfig.m
//  UIView-AlertView
//
//  Created by ucse on 2017/9/12.
//  Copyright © 2017年 lyt. All rights reserved.
//

#import "AVV_AlertViewConfig.h"
#import "AVV_MacroDef.h"

static AVV_AlertViewConfig *sharedInstance;
@implementation AVV_AlertViewConfig

+ (instancetype)sharedInstance {
    static dispatch_once_t AlertViewConfigOnceToken;
    
    dispatch_once(&AlertViewConfigOnceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}


//#define kLineHeight             0.5f
//
//#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
//
//#define kColorWhite                 RGBCOLOR(254,254,254)
//#define kColorBlack             KColorNewTitleTxt              //黑色字体
//#define KColorNewTitleTxt           RGBCOLOR(0x33, 0x33, 0x33)
//#define kColorGray                  RGBCOLOR(115,115,115)           //灰色字体
//#define kFontMiddle                 [UIFont systemFontOfSize:15]
//#define kFontLarge_b                [UIFont boldSystemFontOfSize:16]
//#define kColorLine              RGBCOLOR(216,216,216)           //分割线颜色
//#define kColorClear                 [UIColor clearColor]
//#define KColorAppMain               RGBCOLOR(0xfb, 0x8d, 0xc4) //app主色调

-(id)init
{
    self = [super init];
    if(self){
    
        self.lineHeight = kAVV_LineHeight;
        self.lineColor = kAVV_ColorLine;
        
        self.alertViewBKColor = kAVV_ColorWhite;
        
        self.titleColor = kAVV_ColorWhite;
        self.titleFont = kAVV_FontLarge_b;
        
        self.msgFont = kAVV_FontMiddle;
        self.msgColor = kAVV_ColorGray;
        self.msgNoTitleColor = kAVV_ColorBlack;
        
        self.btnNormalFont = kAVV_FontMiddle;
        self.btnNormalColor = kAVV_ColorGray;
        self.btnNormalBKColor = kAVV_ColorWhite;
        
        self.btnSelectedFont = kAVV_FontLarge_b;
        self.btnSelectedColor = kAVV_ColorAppMain;
        self.btnSelectedBKColor = kAVV_ColorWhite;
        

        
    
        
    }
    return self;
}


@end
