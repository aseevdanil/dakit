//
//  UIViewController+DA.h
//  loveplanet
//
//  Created by da on 30.08.13.
//  Copyright (c) 2013 RBC. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIViewController (DA)

- (void)reloadView;
- (void)clearView:(BOOL)clearChildsHierarchy;
- (BOOL)isViewVisible;
- (void)viewWillClear;
- (void)viewDidClear;

@end
