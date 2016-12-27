//
//  NSData+StringRepresentation.m
//  Loveplanet
//
//  Created by da on 19.09.12.
//  Copyright (c) 2012 RBC. All rights reserved.
//

#import "NSData+StringRepresentation.h"



@implementation NSData (StringRepresentation)


- (NSString*)stringRepresentation
{
	NSMutableString *result = [[NSMutableString alloc] initWithCapacity:2 * [self length]];
	for (NSUInteger i = 0; i < [self length]; ++i)
	{
		unsigned int byte = (unsigned char) *((char*)[self bytes] + i);
		[result appendFormat:@"%02x", byte];
	}
	return result;
}


@end
