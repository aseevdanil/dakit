//
//  NSDictionary+DA.h
//  dakit
//
//  Created by da on 16.05.16.
//  Copyright © 2016 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (DA)

+ (instancetype)dictionaryWithObjectsForKeys:(NSArray<KeyType>*)keys fromDictionary:(NSDictionary<KeyType,ObjectType>*)otherDictionary;

@end
