//
//  NSSet+DA.m
//  dakit
//
//  Created by da on 11.10.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import "NSSet+DA.h"



@implementation NSSet (DA)


- (id)anyObjectPassingTest:(BOOL (^)(id object))predicate
{
	DASSERT(predicate);

	NSSet *objectsPassingTest = [self objectsPassingTest:^(id obj, BOOL *stop)
								 {
									 if (predicate(obj))
									 {
										 *stop = YES;
										 return YES;
									 }
									 return NO;
								 }];
	return [objectsPassingTest count] > 0 ? [objectsPassingTest anyObject] : nil;
}


@end
