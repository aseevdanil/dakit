//
//  NSData+Hash.m
//  dakit
//
//  Created by da on 08.04.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "NSData+Hash.h"

#import <CommonCrypto/CommonDigest.h>



static NSString *const Md5Format = @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X";

static NSString* MD5FromBytes(const void *data, CC_LONG len)
{
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(data, len, result);
	return [NSString stringWithFormat:
			Md5Format,
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];
}



@implementation NSData (Hash)


- (NSString*)MD5Hash
{
	return MD5FromBytes([self bytes], (CC_LONG)[self length]);
}


@end
