//
//  NSStream+DA.m
//  dakit
//
//  Created by da on 30.04.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "NSStream+DA.h"



@implementation NSStream (DA)


- (long long)fileCurrentOffset
{
	NSNumber *fileCurrentOffset = (NSNumber*)[self propertyForKey:NSStreamFileCurrentOffsetKey];
	return fileCurrentOffset ? [fileCurrentOffset longLongValue] : 0;
}


- (void)setFileCurrentOffset:(long long)fileCurrentOffset
{
	[self setProperty:[NSNumber numberWithLongLong:fileCurrentOffset] forKey:NSStreamFileCurrentOffsetKey];
}


@end
