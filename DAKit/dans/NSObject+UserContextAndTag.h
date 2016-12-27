//
//  NSObject+UserContextAndTag.h
//  dakit
//
//  Created by da on 09.08.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSObject (UserContextAndTag)

@property (nonatomic, strong) id userContext;
@property (nonatomic, assign) NSUInteger userTag;

@end
