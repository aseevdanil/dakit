//
//  NSURL+UbiquitousItemProperty.h
//  dakit
//
//  Created by da on 16.01.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSURL (UbiquitousItemProperty)

@property (nonatomic, assign, readonly, getter = isUbiquitousItem) BOOL ubiquitousItem;
@property (nonatomic, assign, readonly) BOOL ubiquitousItemHasUnresolvedConflicts;
@property (nonatomic, assign, readonly) BOOL ubiquitousItemIsDownloaded;
@property (nonatomic, assign, readonly) BOOL ubiquitousItemIsDownloading;
@property (nonatomic, assign, readonly) BOOL ubiquitousItemIsUploaded;
@property (nonatomic, assign, readonly) BOOL ubiquitousItemIsUploading;

@end
