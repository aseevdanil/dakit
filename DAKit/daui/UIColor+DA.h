//
//  UIColor+DA.h
//  dakit
//
//  Created by da on 25.12.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIColor (DA)

+ (UIColor *)colorWithRGBAComponents:(const CGFloat[])components;
+ (UIColor *)colorWithCOLORREF:(DA_COLOR_REF)coloref;

- (instancetype)initWithRGBAComponents:(const CGFloat[])components;
- (instancetype)initWithWithCOLORREF:(DA_COLOR_REF)coloref;

@end
