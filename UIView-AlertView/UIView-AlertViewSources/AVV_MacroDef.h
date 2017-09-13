//
//  AVV_MacroDef.h
//  UIView-AlertView
//
//  Created by ucse on 2017/9/12.
//  Copyright © 2017年 lyt. All rights reserved.
//

#ifndef AVV_MacroDef_h
#define AVV_MacroDef_h


#define kAVV_ScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kAVV_ScreenHeight           [UIScreen mainScreen].bounds.size.height
#define kAVV_LineHeight             0.5f

#define AVV_RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define kAVV_ColorWhite                 AVV_RGBCOLOR(254,254,254)
#define kAVV_ColorBlack                 KAVV_ColorNewTitleTxt              //黑色字体
#define KAVV_ColorNewTitleTxt           AVV_RGBCOLOR(0x33, 0x33, 0x33)
#define kAVV_ColorGray                  AVV_RGBCOLOR(115,115,115)           //灰色字体
#define kAVV_FontMiddle                 [UIFont systemFontOfSize:15]
#define kAVV_FontLarge_b                [UIFont boldSystemFontOfSize:16]
#define kAVV_ColorLine                  AVV_RGBCOLOR(0xce,0xbf,0xc0)           //分割线颜色
#define kAVV_ColorClear                 [UIColor clearColor]
#define kAVV_ColorAppMain               AVV_RGBCOLOR(0xfb, 0x8d, 0xc4) //app主色调

#endif /* AVV_MacroDef_h */
