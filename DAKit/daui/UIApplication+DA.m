//
//  UIApplication+DA.m
//  dakit
//
//  Created by da on 25.09.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "UIApplication+DA.h"



@implementation UIApplication (DA)


+ (CGAffineTransform)interfaceOrientationTransformForOrientation:(UIInterfaceOrientation)orientation
{
	switch (orientation)
	{
		case UIInterfaceOrientationLandscapeLeft:		return CGAffineTransformMakeRotation(3 * M_PI_2);
		case UIInterfaceOrientationLandscapeRight:		return CGAffineTransformMakeRotation(M_PI_2);
		case UIInterfaceOrientationPortraitUpsideDown:	return CGAffineTransformMakeRotation(-M_PI);
		case UIInterfaceOrientationPortrait:
		default:										return CGAffineTransformIdentity;
	}
}


- (CGAffineTransform)interfaceOrientationTransform
{
	return [UIApplication interfaceOrientationTransformForOrientation:self.statusBarOrientation];
}


//- (CGRect)statusBarFrameInView:(UIView*)view
//{
//	NSMutableArray *views = [[NSMutableArray alloc] init];
//	UIView *superview = view;
//	while (superview)
//	{
//		[views addObject:superview];
//		superview = superview.superview;
//	}
//	CGRect statusBarFrame = self.statusBarFrame;
//	for (NSInteger i = views.count - 1; i >= 0; --i)
//	{
//		UIView *v = (UIView*)[views objectAtIndex:i];
//		CGAffineTransform vTransform = v.transform;
//		CGRect vBounds = CGRectApplyAffineTransform(v.bounds, vTransform);
//		CGPoint vOrigin = v.center;
//		vOrigin.x -= vBounds.size.width / 2 + vBounds.origin.x;
//		vOrigin.y -= vBounds.size.height / 2 + vBounds.origin.y;
//		statusBarFrame.origin.x -= vOrigin.x;
//		statusBarFrame.origin.y -= vOrigin.y;
//		statusBarFrame = CGRectApplyAffineTransform(statusBarFrame, CGAffineTransformInvert(vTransform));
//	}
//	return statusBarFrame;
//}


@end
