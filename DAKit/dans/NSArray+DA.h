//
//  NSArray+DA.h
//  dakit
//
//  Created by da on 15.04.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSArray (DA)

- (BOOL)containsObjectIdenticalTo:(id)object;

- (NSArray*)arrayByAddingObject:(id)object atIndex:(NSUInteger)index;
- (NSArray*)arrayByRemovingObjectAtIndex:(NSUInteger)index;
- (NSArray*)arrayByReplacingObjectAtIndex:(NSUInteger)index withObject:(id)object;

- (NSArray*)reversedArray;
- (NSArray*)shuffledArray;

@end



@interface NSMutableArray (DA)

- (void)addObjectsFromArrayToBegin:(NSArray *)otherArray;

- (NSUInteger)insertObject:(id)object usingComparator:(NSComparator)cmp;

- (void)reverse;
- (void)shuffle;

@end
