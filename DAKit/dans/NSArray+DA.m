//
//  NSArray+DAs.m
//  dakit
//
//  Created by da on 15.04.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import "NSArray+DA.h"



@implementation NSArray (DA)


- (BOOL)containsObjectIdenticalTo:(id)object
{
	return [self indexOfObjectIdenticalTo:object] != NSNotFound;
}


- (NSArray*)arrayByAddingObject:(id)object atIndex:(NSUInteger)index
{
	DASSERT(index != NSNotFound && index <= [self count]);
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[self count] + 1];
	if (index > 0)
		[result replaceObjectsInRange:NSMakeRange(0, 0) withObjectsFromArray:self range:NSMakeRange(0, index)];
	[result addObject:object];
	if (index < [self count])
		[result replaceObjectsInRange:NSMakeRange(index + 1, 0) withObjectsFromArray:self range:NSMakeRange(index, [self count] - index)];
	return result;
}


- (NSArray*)arrayByRemovingObjectAtIndex:(NSUInteger)index
{
	DASSERT(index != NSNotFound && index <= [self count]);
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:self.count - 1];
	if (index > 0)
		[result replaceObjectsInRange:NSMakeRange(0, 0) withObjectsFromArray:self range:NSMakeRange(0, index)];
	if (index < self.count - 1)
		[result replaceObjectsInRange:NSMakeRange(index, 0) withObjectsFromArray:self range:NSMakeRange(index + 1, self.count - (index + 1))];
	return result;
}


- (NSArray*)arrayByReplacingObjectAtIndex:(NSUInteger)index withObject:(id)object
{
	DASSERT(index != NSNotFound && index <= [self count]);
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[self count]];
	if (index > 0)
		[result replaceObjectsInRange:NSMakeRange(0, 0) withObjectsFromArray:self range:NSMakeRange(0, index)];
	[result addObject:object];
	if (index < [self count] - 1)
		[result replaceObjectsInRange:NSMakeRange(index + 1, 0) withObjectsFromArray:self range:NSMakeRange(index + 1, [self count] - (index + 1))];
	return result;
}


- (NSArray*)reversedArray
{
	NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:self.count];
	for (NSInteger i = self.count - 1; i >= 0; --i)
		[result addObject:[self objectAtIndex:i]];
	return result;
}


- (NSArray*)shuffledArray
{
	NSMutableArray *result = [self mutableCopy];
	[result shuffle];
	return result;
}


@end



@implementation NSMutableArray (DA)


- (void)addObjectsFromArrayToBegin:(NSArray *)otherArray
{
	[self replaceObjectsInRange:NSMakeRange(0, 0) withObjectsFromArray:otherArray];
}


- (NSUInteger)insertObject:(id)object usingComparator:(NSComparator)cmp
{
	if (cmp)
	{
		NSUInteger index = [self indexOfObject:object inSortedRange:NSMakeRange(0, [self count]) options:NSBinarySearchingInsertionIndex usingComparator:cmp];
		[self insertObject:object atIndex:index];
		return index;
	}
	else
	{
		[self addObject:object];
		return [self count] - 1;
	}
}


- (void)reverse
{
	const NSUInteger count = [self count];
	const NSUInteger halfCount = count / 2;
	for (NSUInteger i = 0; i < halfCount; ++i)
		[self exchangeObjectAtIndex:i withObjectAtIndex:count - 1 - i];
}


- (void)shuffle
{
	for (NSInteger i = self.count - 1; i > 0; --i)
	{
		NSInteger j = DARandom() % i;
		[self exchangeObjectAtIndex:i withObjectAtIndex:j];
	}
}


@end
