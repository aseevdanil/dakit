//
//  NSUserDefaults+DA.m
//  dakit
//
//  Created by da on 20.04.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import "NSUserDefaults+DA.h"



@implementation NSUserDefaults (DA)


- (CGPoint)CGPointForKey:(NSString*)defaultName defaultValue:(CGPoint)defaultValue
{
    NSData *data = (NSData*)[self objectForKey:defaultName];
    if (data)
        [data getBytes:&defaultValue length:sizeof(CGPoint)];
    return defaultValue;
}


- (void)setCGPoint:(CGPoint)value forKey:(NSString*)defaultName
{
    NSData *data = [[NSData alloc] initWithBytesNoCopy:&value length:sizeof(CGPoint) freeWhenDone:NO];
    [self setObject:data forKey:defaultName];
}


@end
