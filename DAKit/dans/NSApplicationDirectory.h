//
//  NSApplicationDirectory.h
//  dakit
//
//  Created by da on 28.11.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



NS_INLINE NSString* NSDocumentsDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

NS_INLINE NSString* NSSupportDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

NS_INLINE NSString* NSCacheDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

//NS_INLINE NSString* NSTemporaryDirectory()
