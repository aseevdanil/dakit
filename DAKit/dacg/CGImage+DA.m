//
//  CGImage+DA.m
//  DAKit
//
//  Created by da on 27.12.16.
//  Copyright © 2016 Aseev Danil. All rights reserved.
//

#import "CGImage+DA.h"



CGImageRef CGImageCreateFilledImage(CGImageRef image, CGColorRef fillColor)
{
	if (!image)
		return NULL;
	
	CGColorSpaceRef space = NULL;
	CGContextRef context = NULL;
	
	CGFloat width = CGImageGetWidth(image), height = CGImageGetHeight(image);
	
	space = CGColorSpaceCreateDeviceRGB();
	if (!space)
		goto cleanup;
	
	context = CGBitmapContextCreate(NULL, width, height, 8, 0, space, kCGImageAlphaPremultipliedLast);
	if (!context)
		goto cleanup;
	
	CGRect rect = CGRectMake(0., 0., width, height);
	CGContextClipToMask(context, rect, image);
	if (fillColor)
		CGContextSetFillColorWithColor(context, fillColor);
	CGContextFillRect(context, rect);
	
	image = CGBitmapContextCreateImage(context);
	
cleanup:
	if (context)
		CGContextRelease(context);
	if (space)
		CGColorSpaceRelease(space);
	
	return image;
}
