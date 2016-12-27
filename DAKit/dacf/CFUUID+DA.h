//
//  CFUUID+DA.h
//  dakit
//
//  Created by da on 16.12.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>



CFUUIDRef CFUUIDCreateFromFlatString(CFAllocatorRef alloc, CFStringRef string);
CFUUIDRef CFUUIDCreateFromData(CFAllocatorRef alloc, CFDataRef data);

CFStringRef CFUUIDCreateFlatLowercaseString(CFAllocatorRef alloc, CFUUIDRef uuid);
CFStringRef CFUUIDCreateFlatUppercaseString(CFAllocatorRef alloc, CFUUIDRef uuid);
CFDataRef CFUUIDCreateData(CFAllocatorRef alloc, CFUUIDRef uuid);
