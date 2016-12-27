//
//  DAMacros.h
//
//  Created by da on 29.01.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//


///////////////////////////////////////////////////////////////////////////////////////////////////
// Flags
#define IS_FLAG(value, flag)		(((value) & (flag)) == (flag))
#define SET_FLAG(value, flag)		(value |= (flag))
#define RES_FLAG(value, flag)		(value &= ~(flag))
#define SWITCH_FLAG(value, flag)	(value = ((~value) & (flag)) | (value & ~(flag)))


///////////////////////////////////////////////////////////////////////////////////////////////////
// Compering
#define DELTA_COMPARE(a, op, b, delta) ({__typeof__(delta) __d = (a) - (b); (__d < 0 ? -__d : __d) < (delta) ? (0 op 0.) : (__d op 0.);})


///////////////////////////////////////////////////////////////////////////////////////////////////
// Time
#define DA_MINUTE 60.
#define DA_HOUR   (60 * DA_MINUTE)
#define DA_DAY    (24 * DA_HOUR)
#define DA_5_DAYS (5 * DA_DAY)
#define DA_WEEK   (7 * DA_DAY)
#define DA_MONTH  (30.5 * DA_DAY)
#define DA_YEAR   (365 * DA_DAY)


///////////////////////////////////////////////////////////////////////////////////////////////////
// Safe releases
// Release a CoreFoundation object safely.
#define DA_RELEASE_CF(__REF) { if (nil != (__REF)) { CFRelease(__REF); __REF = nil; } }


///////////////////////////////////////////////////////////////////////////////////////////////////
// Objects Compare

// NSString
#define DA_COMPARE_STRINGS(__OBJ1,__OBJ2) (__OBJ1 == __OBJ2 || (__OBJ1 && [__OBJ1 isEqualToString:__OBJ2]))

// NSDate
#define DA_COMPARE_DATES(__OBJ1,__OBJ2) (__OBJ1 == __OBJ2 || (__OBJ1 && [__OBJ1 isEqualToDate:__OBJ2]))


///////////////////////////////////////////////////////////////////////////////////////////////////
// UIKit Macroses
#define UI_MULTITASKING_SUPORTED	([[UIDevice currentDevice] isMultitaskingSupported])
#define UI_SCALE					([[UIScreen mainScreen] scale])
#define UI_PIXEL					(1. / [[UIScreen mainScreen] scale])


#define NOTIFICATION_DECL(n) FOUNDATION_EXTERN NSString *const n;
#define NOTIFICATION_IMPL(n) NSString *const n = @#n;


///////////////////////////////////////////////////////////////////////////////////////////////////
// Color
#define DA_COLOR_REF			unsigned int
#define DA_COLOR_MAKE(r,g,b,a)	(((r & 0xFF)) | ((g & 0xFF) << 8) | ((b & 0xFF) << 16) | ((a & 0xFF) << 24))
#define DA_COLOR_GETR(rgba)		((rgba & 0xFF))
#define DA_COLOR_GETG(rgba)		(((rgba >> 8) & 0xFF))
#define DA_COLOR_GETB(rgba)		(((rgba >> 16) & 0xFF))
#define DA_COLOR_GETA(rgba)		(((rgba >> 24) & 0xFF))
#define DA_COLOR_GETFR(rgba)	((CGFloat)(rgba & 0xFF) / 255.)
#define DA_COLOR_GETFG(rgba)	((CGFloat)((rgba >> 8) & 0xFF) / 255.)
#define DA_COLOR_GETFB(rgba)	((CGFloat)((rgba >> 16) & 0xFF) / 255.)
#define DA_COLOR_GETFA(rgba)	((CGFloat)((rgba >> 24) & 0xFF) / 255.)



///////////////////////////////////////////////////////////////////////////////////////////////////
// System Versioning

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/*
 *  Usage

if (SYSTEM_VERSION_LESS_THAN(@"4.0")) {
    ...
}

if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"3.1.1")) {
    ...
}
 
 */



///////////////////////////////////////////////////////////////////////////////////////////////////
// App Extensions

//#define DA_APP_EXTENSIONS
