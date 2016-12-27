//
//  UIColor+DA.m
//  dakit
//
//  Created by da on 25.12.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import "UIColor+DA.h"



@implementation UIColor (DA)


+ (UIColor *)colorWithRGBAComponents:(const CGFloat[])components
{
	return [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:components[3]];
}


+ (UIColor *)colorWithCOLORREF:(DA_COLOR_REF)coloref
{
	return [self colorWithRed:DA_COLOR_GETFR(coloref) green:DA_COLOR_GETFG(coloref) blue:DA_COLOR_GETFB(coloref) alpha:DA_COLOR_GETFA(coloref)];
}


- (instancetype)initWithRGBAComponents:(const CGFloat[])components
{
	return [self initWithRed:components[0] green:components[1] blue:components[2] alpha:components[3]];
}


- (instancetype)initWithWithCOLORREF:(DA_COLOR_REF)coloref
{
	return [self initWithRed:DA_COLOR_GETFR(coloref) green:DA_COLOR_GETFG(coloref) blue:DA_COLOR_GETFB(coloref) alpha:DA_COLOR_GETFA(coloref)];
}


@end
