//
//  DAUUID.m
//  dakit
//
//  Created by da on 14.04.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "DAUUID.h"



@implementation DAUUID


#pragma mark -
#pragma mark Base


@synthesize cfuuid = _cfuuid;


- (instancetype)init
{
	return [self initWithCFUUID:NULL];
}


- (instancetype)initWithCFUUID:(CFUUIDRef)cfuuid
{
	if ((self = [super init]))
	{
		_cfuuid = cfuuid ? CFRetain(cfuuid) : CFUUIDCreate(kCFAllocatorDefault);
	}
	return self;
}


- (instancetype)initWithUUIDBytes:(const uuid_t)bytes
{
	CFUUIDRef cfuuid = bytes ? CFUUIDCreateFromUUIDBytes(kCFAllocatorDefault, *((const CFUUIDBytes*) bytes)) : NULL;
	self = [self initWithCFUUID:cfuuid];
	if (cfuuid)
		CFRelease(cfuuid);
	return self;
}


- (instancetype)initWithUUIDData:(NSData*)data
{
	CFUUIDRef cfuuid = data ? CFUUIDCreateFromData(kCFAllocatorDefault, (__bridge CFDataRef) data) : NULL;
	self = [self initWithCFUUID:cfuuid];
	if (cfuuid)
		CFRelease(cfuuid);
	return self;
}


- (instancetype)initWithUUIDString:(NSString *)string
{
	CFUUIDRef cfuuid = string ? CFUUIDCreateFromString(kCFAllocatorDefault, (CFStringRef) string) : NULL;
	self = [self initWithCFUUID:cfuuid];
	if (cfuuid)
		CFRelease(cfuuid);
	return self;
}


- (instancetype)initWithUUIDFlatString:(NSString *)string
{
	CFUUIDRef cfuuid = string ? CFUUIDCreateFromFlatString(kCFAllocatorDefault, (__bridge CFStringRef) string) : NULL;
	self = [self initWithCFUUID:cfuuid];
	if (cfuuid)
		CFRelease(cfuuid);
	return self;
}


- (void)dealloc
{
	if (_cfuuid)
		CFRelease(_cfuuid);
}


#pragma mark -
#pragma mark NSObject


- (BOOL)isEqual:(id)anObject
{
	return anObject && [anObject class] == [self class] ? CFEqual(_cfuuid, ((DAUUID*) anObject)->_cfuuid) : NO;
}


- (NSUInteger)hash
{
	CFUUIDBytes bytes = CFUUIDGetUUIDBytes(_cfuuid);
	return (NSUInteger)
	((NSUInteger)((NSUInteger) bytes.byte0) | (((NSUInteger) bytes.byte1) << 8) | (((NSUInteger) bytes.byte2) << 16) | (((NSUInteger) bytes.byte3) << 24)) +
	((NSUInteger)((NSUInteger) bytes.byte4) | (((NSUInteger) bytes.byte5) << 8) | (((NSUInteger) bytes.byte6) << 16) | (((NSUInteger) bytes.byte7) << 24)) +
	((NSUInteger)((NSUInteger) bytes.byte8) | (((NSUInteger) bytes.byte9) << 8) | (((NSUInteger) bytes.byte10) << 16) | (((NSUInteger) bytes.byte11) << 24)) +
	((NSUInteger)((NSUInteger) bytes.byte12) | (((NSUInteger) bytes.byte13) << 8) | (((NSUInteger) bytes.byte14) << 16) | (((NSUInteger) bytes.byte15) << 24));
}


- (NSString *)description
{
	return [self UUIDString];
}


- (id)copyWithZone:(NSZone *)zone
{
	return self;
}


static NSString *const kDAUUID_Cfuuid = @"cfuuid";


- (void)encodeWithCoder:(NSCoder *)coder
{
	CFUUIDBytes handleBytes = CFUUIDGetUUIDBytes(_cfuuid);
	[coder encodeBytes:(const uint8_t*) &handleBytes length:sizeof(CFUUIDBytes) forKey:kDAUUID_Cfuuid];
}


- (instancetype)initWithCoder:(NSCoder *)decoder
{
	if ((self = [super init]))
	{
		NSUInteger handleBytesLength = 0;
		const uint8_t *handleBytes = [decoder decodeBytesForKey:kDAUUID_Cfuuid returnedLength:&handleBytesLength];
		if (handleBytes)
		{
			DASSERT(handleBytesLength == sizeof(CFUUIDBytes));
			_cfuuid = CFUUIDCreateFromUUIDBytes(kCFAllocatorDefault, *((CFUUIDBytes*) handleBytes));
		}
	}
	return self;
}


#pragma mark -
#pragma mark Properties


- (void)getUUIDBytes:(uuid_t)uuid
{
	*((CFUUIDBytes*) uuid) = CFUUIDGetUUIDBytes(_cfuuid);
}


- (NSData*)UUIDData
{
	return (NSData*) CFBridgingRelease(CFUUIDCreateData(kCFAllocatorDefault, _cfuuid));
}


- (NSString *)UUIDString
{
	return (NSString*) CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, _cfuuid));
}


- (NSString *)UUIDFlatLowercaseString
{
	return (NSString*) CFBridgingRelease(CFUUIDCreateFlatLowercaseString(kCFAllocatorDefault, _cfuuid));
}


- (NSString *)UUIDFlatUppercaseString
{
	return (NSString*) CFBridgingRelease(CFUUIDCreateFlatUppercaseString(kCFAllocatorDefault, _cfuuid));
}


@end
