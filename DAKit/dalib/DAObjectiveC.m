//
//  DAObjectiveC.m
//  dakit
//
//  Created by da on 17.05.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import "DAObjectiveC.h"

#import <objc/runtime.h>



void DASwizzleExchangeClassMethod(Class objcClass, SEL originalMethodSelector, SEL newMethodSelector)
{
	Method originalMethod = class_getClassMethod(objcClass, originalMethodSelector);
    Method newMethod = class_getClassMethod(objcClass, newMethodSelector);
    
    method_exchangeImplementations(originalMethod, newMethod);
}



void DASwizzleExchangeInstanceMethod(Class objcClass, SEL originalMethodSelector, SEL newMethodSelector)
{
	Method originalMethod = class_getInstanceMethod(objcClass, originalMethodSelector);
    Method newMethod = class_getInstanceMethod(objcClass, newMethodSelector);
    
    if (class_addMethod(objcClass, originalMethodSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
	{
        class_replaceMethod(objcClass, newMethodSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

