//
//  NSNumber+CG.h
//  daui
//
//  Created by da on 02.10.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>



@interface NSNumber (CG)

- (CGFloat)CGFloatValue;
- (instancetype)initWithCGFloat:(CGFloat)value;
+ (NSNumber *)numberWithCGFloat:(CGFloat)value;

@end
