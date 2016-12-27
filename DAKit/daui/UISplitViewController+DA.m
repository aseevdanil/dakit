//
//  UISplitViewController+DA.m
//  dakit
//
//  Created by da on 03.03.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import "UISplitViewController+DA.h"



@implementation UISplitViewController (DA)


- (UIViewController*)masterViewController
{
	NSArray *viewControllers = self.viewControllers;
	return [viewControllers count] > 0 ? (UIViewController*)[viewControllers objectAtIndex:0] : nil;
}


- (UIViewController*)detailViewController
{
	NSArray *viewControllers = self.viewControllers;
	return [viewControllers count] > 1 ? (UIViewController*)[viewControllers objectAtIndex:1] : nil;
}


@end
