//
//  UIScreen+DA.m
//  dakit
//
//  Created by da on 20.11.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import "UIScreen+DA.h"



inline CGFloat UIScreenScale()
{
	static CGFloat ScreenScale = 1.;
	static dispatch_once_t predicate;
	dispatch_once(&predicate, ^{ ScreenScale = [UIScreen mainScreen].scale; });
	return ScreenScale;
}


inline CGFloat UIScreenPixel()
{
	static CGFloat ScreenPixel = 1.;
	static dispatch_once_t predicate;
	dispatch_once(&predicate, ^{ ScreenPixel = 1. / UIScreenScale(); });
	return ScreenPixel;
}
