//
//  CGImage+DA.m
//  dakit
//
//  Created by da on 13.12.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import "CGImage+DA.h"



CGImageRef CGImageCreateShapedImage(CGSize size, CGImageShape shape, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGFloat cornerRadius, CGPathDrawingMode drawingMode)
{
	size = CGSizeIntegral(size);
	lineWidth = (CGFloat)(NSInteger) lineWidth;
	cornerRadius = (CGFloat)(NSInteger) cornerRadius;
	if (CGSizeEqualToSize(size, CGSizeZero))
		return NULL;
	
	CGImageRef image = NULL;
	CGColorSpaceRef space = NULL;
	CGContextRef context = NULL;
	
	space = CGColorSpaceCreateDeviceRGB();
	if (!space)
		goto cleanup;
	
	context = CGBitmapContextCreate(NULL, size.width, size.height, 8, size.width * 4, space, (CGBitmapInfo) kCGImageAlphaPremultipliedLast);
	if (!context)
		goto cleanup;
	
	CGRect rect = {lineWidth / 2, lineWidth / 2, size.width - lineWidth, size.height - lineWidth};
	switch (shape)
	{
		case kCGImageShapeRoundedRect:
			CGContextAddRoundedRect(context, rect, cornerRadius);
			break;
		case kCGImageShapeEllipse:
			CGContextAddEllipseInRect(context, rect);
			break;
		case kCGImageShapeRectangle:
		default:
			CGContextAddRect(context, rect);
			break;
	}
	if (fillColor)
		CGContextSetFillColorWithColor(context, fillColor);
	if (strokeColor)
		CGContextSetStrokeColorWithColor(context, strokeColor);
	CGContextSetLineWidth(context, lineWidth);
	CGContextDrawPath(context, drawingMode);
	
	image = CGBitmapContextCreateImage(context);
	
cleanup:
	if (context)
		CGContextRelease(context);
	if (space)
		CGColorSpaceRelease(space);
	
	return image;
}


CGImageRef CGImageCreateRectangleImage(CGSize size, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGPathDrawingMode drawingMode)
{
	return CGImageCreateShapedImage(size, kCGImageShapeRectangle, fillColor, strokeColor, lineWidth, 0., drawingMode);
}


CGImageRef CGImageCreateRoundedRectImage(CGSize size, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGFloat cornerRadius, CGPathDrawingMode drawingMode)
{
	return CGImageCreateShapedImage(size, kCGImageShapeRoundedRect, fillColor, strokeColor, lineWidth, cornerRadius, drawingMode);
}


CGImageRef CGImageCreateEllipseImage(CGSize size, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGPathDrawingMode drawingMode)
{
	return CGImageCreateShapedImage(size, kCGImageShapeEllipse, fillColor, strokeColor, lineWidth, 0., drawingMode);
}
