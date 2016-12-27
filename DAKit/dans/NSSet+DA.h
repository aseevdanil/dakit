//
//  NSSet+DA.h
//  dakit
//
//  Created by da on 11.10.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSSet (DA)

- (id)anyObjectPassingTest:(BOOL (^)(id obj))predicate;

@end
