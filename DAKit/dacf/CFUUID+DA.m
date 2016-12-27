//
//  CFUUID+DA.m
//  xnotes
//
//  Created by da on 16.12.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import "CFUUID+DA.h"



CF_INLINE char __UUIDCharacterToNumber(UniChar c)
{
	switch (c)
	{
		case '0': return 0;
		case '1': return 1;
		case '2': return 2;
		case '3': return 3;
		case '4': return 4;
		case '5': return 5;
		case '6': return 6;
		case '7': return 7;
		case '8': return 8;
		case '9': return 9;
		case 'A':
		case 'a': return 0x0A;
		case 'B':
		case 'b': return 0x0B;
		case 'C':
		case 'c': return 0x0C;
		case 'D':
		case 'd': return 0x0D;
		case 'E':
		case 'e': return 0x0E;
		case 'F':
		case 'f': return 0x0F;
		default:  return 0;
	}
}


CFUUIDRef CFUUIDCreateFromFlatString(CFAllocatorRef alloc, CFStringRef string)
{
	if (!string || CFStringGetLength(string) != 2 * 16)
		return NULL;
	
	CFUUIDBytes bytes;
	bytes.byte0 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 0)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 0 + 1)));
	bytes.byte1 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 1)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 1 + 1)));
	bytes.byte2 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 2)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 2 + 1)));
	bytes.byte3 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 3)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 3 + 1)));
	bytes.byte4 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 4)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 4 + 1)));
	bytes.byte5 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 5)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 5 + 1)));
	bytes.byte6 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 6)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 6 + 1)));
	bytes.byte7 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 7)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 7 + 1)));
	bytes.byte8 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 8)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 8 + 1)));
	bytes.byte9 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 9)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 9 + 1)));
	bytes.byte10 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 10)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 10 + 1)));
	bytes.byte11 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 11)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 11 + 1)));
	bytes.byte12 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 12)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 12 + 1)));
	bytes.byte13 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 13)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 13 + 1)));
	bytes.byte14 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 14)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 14 + 1)));
	bytes.byte15 = (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 15)) << 4) | (__UUIDCharacterToNumber(CFStringGetCharacterAtIndex(string, 2 * 15 + 1)));
	return CFUUIDCreateFromUUIDBytes(alloc, bytes);
}


CFUUIDRef CFUUIDCreateFromData(CFAllocatorRef alloc, CFDataRef data)
{
	DASSERT(CFDataGetLength(data) == sizeof(CFUUIDBytes));
	const UInt8 *bytes = CFDataGetBytePtr(data);
	return CFUUIDCreateFromUUIDBytes(alloc, *((const CFUUIDBytes*) bytes));
}


CFStringRef CFUUIDCreateFlatLowercaseString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
	CFUUIDBytes bytes = CFUUIDGetUUIDBytes(uuid);
	return CFStringCreateWithFormat(alloc, NULL,
									CFSTR("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"),
									bytes.byte0, bytes.byte1, bytes.byte2, bytes.byte3,
									bytes.byte4, bytes.byte5, bytes.byte6, bytes.byte7,
									bytes.byte8, bytes.byte9, bytes.byte10, bytes.byte11,
									bytes.byte12, bytes.byte13, bytes.byte14, bytes.byte15);
}


CFStringRef CFUUIDCreateFlatUppercaseString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
	CFUUIDBytes bytes = CFUUIDGetUUIDBytes(uuid);
	return CFStringCreateWithFormat(alloc, NULL,
									CFSTR("%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X"),
									bytes.byte0, bytes.byte1, bytes.byte2, bytes.byte3,
									bytes.byte4, bytes.byte5, bytes.byte6, bytes.byte7,
									bytes.byte8, bytes.byte9, bytes.byte10, bytes.byte11,
									bytes.byte12, bytes.byte13, bytes.byte14, bytes.byte15);
}


CFDataRef CFUUIDCreateData(CFAllocatorRef alloc, CFUUIDRef uuid)
{
	CFUUIDBytes bytes = CFUUIDGetUUIDBytes(uuid);
	return CFDataCreate(alloc, (UInt8*) &bytes, sizeof(CFUUIDBytes));
}
