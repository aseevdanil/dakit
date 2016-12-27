//
//  NSUserDefaults+DA.h
//  dakit
//
//  Created by da on 20.04.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSUserDefaults (DA)
    
- (CGPoint)CGPointForKey:(NSString*)defaultName defaultValue:(CGPoint)defaultValue;

- (void)setCGPoint:(CGPoint)value forKey:(NSString*)defaultName;

@end
