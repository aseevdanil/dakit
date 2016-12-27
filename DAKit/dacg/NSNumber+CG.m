//
//  NSNumber+CG.m
//  daui
//
//  Created by da on 02.10.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "NSNumber+CG.h"



@implementation NSNumber (CG)


- (CGFloat)CGFloatValue
{
#if CGFLOAT_IS_DOUBLE
	return [self doubleValue];
#else
	return [self floatValue];
#endif
}


- (instancetype)initWithCGFloat:(CGFloat)value
{
#if CGFLOAT_IS_DOUBLE
	return [self initWithDouble:value];
#else
	return [self initWithFloat:value];
#endif
}


+ (NSNumber *)numberWithCGFloat:(CGFloat)value
{
#if CGFLOAT_IS_DOUBLE
	return [self numberWithDouble:value];
#else
	return [self numberWithFloat:value];
#endif
}


@end
