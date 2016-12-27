//
//  UIFont+DA.m
//  dakit
//
//  Created by da on 20.11.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import "UIFont+DA.h"



@implementation UIFont (DA)


- (CGFloat)lineScreenHeight
{
	return SCREEN_LENGTH(self.lineHeight, YES);
}


@end
