//
//  UIApplication+DA.h
//  dakit
//
//  Created by da on 25.09.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIApplication (DA)

+ (CGAffineTransform)interfaceOrientationTransformForOrientation:(UIInterfaceOrientation)orientation;
@property (nonatomic, assign, readonly) CGAffineTransform interfaceOrientationTransform;

//- (CGRect)statusBarFrameInView:(UIView*)view;

@end
