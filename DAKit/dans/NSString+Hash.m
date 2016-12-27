//
//  NSString+Hash.m
//  dakit
//
//  Created by da on 08.04.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "NSString+Hash.h"

#import "NSData+Hash.h"



@implementation NSString (Hash)


- (NSString*)MD5Hash
{
	return [[self dataUsingEncoding:NSUTF8StringEncoding] MD5Hash];
}


@end
