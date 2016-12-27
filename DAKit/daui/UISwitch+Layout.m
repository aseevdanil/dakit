//
//  UISwitch+Layout.m
//  loveplanet
//
//  Created by da on 27.01.14.
//  Copyright (c) 2014 RBC. All rights reserved.
//

#import "UISwitch+Layout.h"



@implementation UISwitch (Layout)


static BOOL UISwitchLayout_Initialized = NO;
static UISwitch *UISwitchLayout_MeasurementSwitch = nil;


+ (UISwitch*)UISwitchLayout_MeasurementSwitch
{
	if (!UISwitchLayout_MeasurementSwitch)
	{
		UISwitchLayout_MeasurementSwitch = [[UISwitch alloc] init];
		UISwitchLayout_MeasurementSwitch.hidden = YES;
	}
	if (!UISwitchLayout_Initialized)
	{
		UISwitchLayout_Initialized = YES;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UISwitchLayout_MemoryWarningNotification:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
	}
	return UISwitchLayout_MeasurementSwitch;
}


+ (void)UISwitchLayout_MemoryWarningNotification:(NSNotification*)notification
{
	UISwitchLayout_MeasurementSwitch = nil;
}


+ (CGSize)standardViewSize
{
	return [self UISwitchLayout_MeasurementSwitch].bounds.size;
}


@end
