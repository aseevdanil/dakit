//
//  DAUUID.h
//  dakit
//
//  Created by da on 14.04.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DAUUID : NSObject <NSCopying, NSCoding>
{
	CFUUIDRef _cfuuid;
}

- (instancetype)init;
- (instancetype)initWithCFUUID:(CFUUIDRef)cfuuid;
- (instancetype)initWithUUIDBytes:(const uuid_t)bytes;
- (instancetype)initWithUUIDData:(NSData*)data;
- (instancetype)initWithUUIDString:(NSString *)string;
- (instancetype)initWithUUIDFlatString:(NSString *)string;

@property (nonatomic, assign, readonly) CFUUIDRef cfuuid;
- (void)getUUIDBytes:(uuid_t)uuid;
- (NSData*)UUIDData;
- (NSString *)UUIDString;
- (NSString *)UUIDFlatLowercaseString;
- (NSString *)UUIDFlatUppercaseString;

@end
