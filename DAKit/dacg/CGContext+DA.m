//
//  CGContext+DA.m
//  dakit
//
//  Created by da on 03.10.16.
//  Copyright © 2016 Aseev Danil. All rights reserved.
//



void CGContextAddRoundedRect(CGContextRef c, CGRect rect, CGFloat radius)
{
	CGContextMoveToPoint(c, CGRectGetMinX(rect), CGRectGetMidY(rect));
	CGContextAddArcToPoint(c, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMidX(rect), CGRectGetMinY(rect), radius);
	CGContextAddArcToPoint(c, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMidY(rect), radius);
	CGContextAddArcToPoint(c, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMidX(rect), CGRectGetMaxY(rect), radius);
	CGContextAddArcToPoint(c, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMidY(rect), radius);
	CGContextClosePath(c);
}
