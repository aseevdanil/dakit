//
//  UISplitViewController+DA.h
//  dakit
//
//  Created by da on 03.03.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UISplitViewController (DA)

@property (nonatomic, retain, readonly) UIViewController *masterViewController;
@property (nonatomic, retain, readonly) UIViewController *detailViewController;

@end
