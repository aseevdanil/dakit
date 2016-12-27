//
//  CGImage+DA.h
//  dakit
//
//  Created by da on 13.12.12.
//  Copyright (c) 2012 Aseev Danil. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>



typedef CF_ENUM (int32_t, CGImageShape)
{
	kCGImageShapeRectangle,
	kCGImageShapeRoundedRect,
	kCGImageShapeEllipse,
};


CGImageRef CGImageCreateShapedImage(CGSize size, CGImageShape shape, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGFloat cornerRadius, CGPathDrawingMode drawingMode);
CGImageRef CGImageCreateRectangleImage(CGSize size, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGPathDrawingMode drawingMode);
CGImageRef CGImageCreateRoundedRectImage(CGSize size, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGFloat cornerRadius, CGPathDrawingMode drawingMode);
CGImageRef CGImageCreateEllipseImage(CGSize size, CGColorRef fillColor, CGColorRef strokeColor, CGFloat lineWidth, CGPathDrawingMode drawingMode);
