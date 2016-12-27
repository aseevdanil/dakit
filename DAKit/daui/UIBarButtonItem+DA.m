//
//  UIBarButtonItem+DA.m
//  dakit
//
//  Created by da on 14.05.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import "UIBarButtonItem+DA.h"



@implementation UIBarButtonItem (DA)


- (instancetype)initWithActivityIndicator:(UIActivityIndicatorViewStyle)style
{
	UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
	self = [self initWithCustomView:activityView];
	[activityView startAnimating];
	return self;
}


@end
