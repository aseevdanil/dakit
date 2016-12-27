//
//  UIViewController+DA.m
//  loveplanet
//
//  Created by da on 30.08.13.
//  Copyright (c) 2013 RBC. All rights reserved.
//

#import "UIViewController+DA.h"



@implementation UIViewController (DA)


- (void)reloadView
{
	if ([self isViewLoaded])
	{
		UIView *superview = self.view.superview;
		NSUInteger subviewIndex = superview ? [superview.subviews indexOfObjectIdenticalTo:self.view] : NSNotFound;
		CGPoint viewCenter = self.view.center;
		CGRect viewBounds = self.view.bounds;
		UIViewAutoresizing autoresizingMask = self.view.autoresizingMask;
		CGAffineTransform viewTransform = self.view.transform;
		[self viewWillClear];
		self.view = nil;
		[self viewDidClear];
		UIView *view = self.view;
		if (view)
		{
			view.center = viewCenter;
			view.bounds = viewBounds;
			view.autoresizingMask = autoresizingMask;
			view.transform = viewTransform;
			if (superview)
			{
				DASSERT(subviewIndex != NSNotFound);
				if (subviewIndex != NSNotFound)
					[superview insertSubview:view atIndex:subviewIndex];
				else
					[superview addSubview:view];
			}
		}
	}
}


- (void)clearView:(BOOL)clearChildsHierarchy
{
	if ([self isViewLoaded])
	{
		[self viewWillClear];
		self.view = nil;
		[self viewDidClear];
	}
	if (clearChildsHierarchy)
	{
		for (UIViewController *vc in self.childViewControllers)
			[vc clearView:clearChildsHierarchy];
	}
}


- (BOOL)isViewVisible
{
	return [self isViewLoaded] && self.view.window;
}


- (void)viewWillClear
{
}


- (void)viewDidClear
{
}


@end
