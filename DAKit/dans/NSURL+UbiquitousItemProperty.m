//
//  NSURL+UbiquitousItemProperty.m
//  dakit
//
//  Created by da on 16.01.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "NSURL+UbiquitousItemProperty.h"



@implementation NSURL (UbiquitousItemProperty)


- (BOOL)isUbiquitousItem
{
	NSNumber *resourceValue = nil;
	return [self getResourceValue:&resourceValue forKey:NSURLIsUbiquitousItemKey error:NULL] ? [resourceValue boolValue] : NO;
}


- (BOOL)ubiquitousItemHasUnresolvedConflicts
{
	NSNumber *resourceValue = nil;
	return [self getResourceValue:&resourceValue forKey:NSURLUbiquitousItemHasUnresolvedConflictsKey error:NULL] ? [resourceValue boolValue] : NO;
}


- (BOOL)ubiquitousItemIsDownloaded
{
	NSString *resourceValue = nil;
	return [self getResourceValue:&resourceValue forKey:NSURLUbiquitousItemDownloadingStatusKey error:NULL] ? (resourceValue && [resourceValue isEqualToString:NSURLUbiquitousItemDownloadingStatusCurrent]) : NO;
}


- (BOOL)ubiquitousItemIsDownloading
{
	NSNumber *resourceValue = nil;
	return [self getResourceValue:&resourceValue forKey:NSURLUbiquitousItemIsDownloadingKey error:NULL] ? [resourceValue boolValue] : NO;
}


- (BOOL)ubiquitousItemIsUploaded
{
	NSNumber *resourceValue = nil;
	return [self getResourceValue:&resourceValue forKey:NSURLUbiquitousItemIsUploadedKey error:NULL] ? [resourceValue boolValue] : NO;
}


- (BOOL)ubiquitousItemIsUploading
{
	NSNumber *resourceValue = nil;
	return [self getResourceValue:&resourceValue forKey:NSURLUbiquitousItemIsUploadingKey error:NULL] ? [resourceValue boolValue] : NO;
}


@end
