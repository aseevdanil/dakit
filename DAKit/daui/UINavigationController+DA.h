//
//  UINavigationController+DA.h
//  dakit
//
//  Created by da on 11.10.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UINavigationController (DA)

@property (nonatomic, retain, readonly) UIViewController *rootViewController;
- (UIViewController*)nextViewControllerForViewController:(UIViewController*)viewController;
- (UIViewController*)prevViewControllerForViewController:(UIViewController*)viewController;

- (void)pushViewController:(UIViewController *)viewController fromViewController:(UIViewController*)fromViewController animated:(BOOL)animated;
- (NSArray*)popToPrevViewController:(UIViewController*)viewController animated:(BOOL)animated;

@end
