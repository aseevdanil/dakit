//
//  UIControl+DA.m
//  dakit
//
//  Created by da on 20.04.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import "UIControl+DA.h"



@implementation UIControl (DA)


- (void)removeAllTargetsForControlEvent:(UIControlEvents)controlEvent
{
	NSSet *targets = [self allTargets];
	for (id target in targets)
	{
		NSArray *targetActions = target && target != [NSNull null] ? [self actionsForTarget:target forControlEvent:controlEvent] : nil;
		if (targetActions)
		{
			for (NSString *selectorString in targetActions)
				[self removeTarget:target action:NSSelectorFromString(selectorString) forControlEvents:controlEvent];
		}
	}
}


@end
