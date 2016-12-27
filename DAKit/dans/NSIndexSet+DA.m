//
//  NSIndexSet+DA.m
//  dakit
//
//  Created by da on 14.11.16.
//  Copyright © 2016 Aseev Danil. All rights reserved.
//

#import "NSIndexSet+DA.h"



@implementation NSIndexSet (DA)


- (NSUInteger)indexNumber:(NSUInteger)value
{
	__block NSUInteger i = 0;
	[self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop)
	 {
		 if (idx == value)
		 {
			 if (stop)
				 *stop = YES;
			 return;
		 }
		 ++i;
	 }];
	return i < self.count ? i : NSNotFound;
}


@end
