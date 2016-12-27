//
//  UINavigationController+DA.m
//  dakit
//
//  Created by da on 11.10.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import "UINavigationController+DA.h"



@implementation UINavigationController (DA)


- (UIViewController*)rootViewController
{
	NSArray *viewControllers = self.viewControllers;
	if (!viewControllers || [viewControllers count] == 0)
		return nil;
	return (UIViewController*)[viewControllers objectAtIndex:0];
}


- (UIViewController*)nextViewControllerForViewController:(UIViewController*)viewController
{
	DASSERT(viewController);
	if (!viewController)
		return nil;
	NSArray *viewControllers = self.viewControllers;
	NSUInteger index = [viewControllers indexOfObjectIdenticalTo:viewController];
	if (index != NSNotFound && index < [viewControllers count] - 1)
		++index;
	else
		index = NSNotFound;
	return index != NSNotFound ? (UIViewController*)[viewControllers objectAtIndex:index] : nil;
}


- (UIViewController*)prevViewControllerForViewController:(UIViewController*)viewController
{
	DASSERT(viewController);
	if (!viewController)
		return nil;
	NSArray *viewControllers = self.viewControllers;
	NSUInteger index = [viewControllers indexOfObjectIdenticalTo:viewController];
	if (index != NSNotFound && index > 0)
		--index;
	else
		index = NSNotFound;
	return index != NSNotFound ? (UIViewController*)[viewControllers objectAtIndex:index] : nil;
}


- (void)pushViewController:(UIViewController *)viewController fromViewController:(UIViewController*)fromViewController animated:(BOOL)animated
{
	if (fromViewController == self.topViewController)
	{
		[self pushViewController:viewController animated:animated];
	}
	else
	{
		NSMutableArray *viewControllers = [self.viewControllers mutableCopy];
		NSUInteger index = [viewControllers indexOfObjectIdenticalTo:fromViewController];
		DASSERT(index != NSNotFound);
		if (index != NSNotFound)
			[viewControllers removeObjectsInRange:NSMakeRange(index + 1, [viewControllers count] - (index + 1))];
		[viewControllers addObject:viewController];
		[self setViewControllers:viewControllers animated:animated];
	}
}


- (NSArray*)popToPrevViewController:(UIViewController*)viewController animated:(BOOL)animated
{
	NSUInteger index = [self.viewControllers indexOfObjectIdenticalTo:viewController];
	if (index == NSNotFound)
		return nil;
	DASSERT(index != 0);
	if (index == 0)
		++index;
	return [self popToViewController:(UIViewController*)[self.viewControllers objectAtIndex:--index] animated:animated];
}


@end
