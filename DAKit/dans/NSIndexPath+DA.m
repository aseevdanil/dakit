//
//  NSIndexPath+DA.m
//  dakit
//
//  Created by da on 06.02.12.
//  Copyright (c) 2012 Russian Internet Solutions. All rights reserved.
//

#import "NSIndexPath+DA.h"



@implementation NSIndexPath (DA)


- (NSComparisonResult)reverseCompare:(NSIndexPath *)indexPath
{
	return -1 * [self compare:indexPath];
}


@end
