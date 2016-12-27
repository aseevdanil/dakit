//
//  NSObject+UserContextAndTag.m
//  dakit
//
//  Created by da on 09.08.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "NSObject+UserContextAndTag.h"

#include <objc/runtime.h>



@implementation NSObject (UserContextAndTag)


static char UserContextKey;
static char UserTagKey;


- (void)setUserContext:(id)userContext
{
	objc_setAssociatedObject(self, &UserContextKey, userContext, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (id)userContext
{
	return objc_getAssociatedObject(self, &UserContextKey);
}


- (void)setUserTag:(NSUInteger)userTag
{
	objc_setAssociatedObject(self, &UserTagKey, userTag ? [NSNumber numberWithUnsignedInteger:userTag] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSUInteger)userTag
{
    NSNumber *userTag = (NSNumber*) objc_getAssociatedObject(self, &UserTagKey);
	return userTag ? [userTag unsignedIntegerValue] : 0;
}


@end
