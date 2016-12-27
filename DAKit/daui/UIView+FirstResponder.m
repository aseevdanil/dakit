//
//  UIView+FirstResponder.m
//  dakit
//
//  Created by da on 13.09.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import "UIView+FirstResponder.h"


@implementation UIView (FirstResponder)


- (UIView*)findFirstResponder
{
	if (self.isFirstResponder)
        return self;     

    for (UIView *subView in self.subviews)
	{
        UIView *firstResponder = [subView findFirstResponder];
		if (firstResponder)
            return firstResponder;
    }
	
    return nil;
}

@end
