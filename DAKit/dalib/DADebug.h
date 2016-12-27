//
//  DADebug.h
//  dakit
//
//  Created by da on 14.08.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



#ifdef DEBUG

/**
 * Assertions that only fire when DEBUG is defined.
 *
 * An assertion is like a programmatic breakpoint. Use it for sanity checks to save headache while
 * writing your code.
 */
#import <TargetConditionals.h>

int IsInDebugger(void);
#define DASSERT(xx) { if (!(xx)) { DPRINT(@"NIDASSERT failed: %s", #xx); \
if (DebugAssertionsShouldBreak && IsInDebugger()) { raise(SIGTRAP); } } \
} ((void)0)

#else // #ifdef DEBUG
#define DASSERT(xx) ((void)0)

#endif // #ifdef DEBUG

/**
 * Whether or not debug assertions should halt program execution like a breakpoint when they fail.
 *
 * An example of when this is used is in unit tests, when failure cases are tested that will
 * fire debug assertions.
 *
 * The default value is YES.
 */
#ifdef DEBUG
extern BOOL DebugAssertionsShouldBreak;
#endif // #ifdef DEBUG

/**
 * Only writes to the log when DEBUG is defined.
 *
 * This log method will always write to the log, regardless of log levels. It is used by all
 * of the other logging methods in Nimbus' debugging library.
 */
#ifdef DEBUG
#define DPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DPRINT(xx, ...)  ((void)0)
#endif // #ifdef DEBUG

