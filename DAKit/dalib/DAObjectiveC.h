//
//  DAObjectiveC.h
//  dakit
//
//  Created by da on 17.05.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import <objc/objc.h>



void DASwizzleExchangeClassMethod(Class objcClass, SEL originalMethodSelector, SEL newMethodSelector);
void DASwizzleExchangeInstanceMethod(Class objcClass, SEL originalMethodSelector, SEL newMethodSelector);
