//
//  NSString+DA.m
//  dakit
//
//  Created by da on 15.04.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import "NSString+DA.h"



@implementation NSString (DA)


+ (NSString*)stringWithInteger:(NSInteger)value
{
    return [NSString stringWithFormat:@"%ld", (long) value];
}


+ (NSString*)stringWithUnsignedInteger:(NSUInteger)value
{
    return [NSString stringWithFormat:@"%lu", (unsigned long) value];
}


@end
