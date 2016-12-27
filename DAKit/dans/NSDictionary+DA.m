//
//  NSDictionary+DA.m
//  dakit
//
//  Created by da on 16.05.16.
//  Copyright © 2016 Aseev Danil. All rights reserved.
//

#import "NSDictionary+DA.h"



@implementation NSDictionary (DA)


+ (instancetype)dictionaryWithObjectsForKeys:(NSArray*)keys fromDictionary:(NSDictionary*)otherDictionary
{
	NSMutableDictionary *result = nil;
	if (otherDictionary && keys)
	{
		result = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
		for (id key in keys)
		{
			id object = [otherDictionary objectForKey:key];
			if (object)
				[result setObject:object forKey:key];
		}
	}
	return result;
}


@end
