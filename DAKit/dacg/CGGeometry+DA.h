//
//  CGGeometry+DA.h
//  dakit
//
//  Created by da on 27.04.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>



#pragma mark CGPoint


CG_INLINE CGPoint CGPointIntegral(CGPoint point)
{
	point.x = (CGFloat)(NSInteger) point.x;
	point.y = (CGFloat)(NSInteger) point.y;
	return point;
}


CG_INLINE CGFloat CGPointDistanceToPoint(CGPoint point1, CGPoint point2)
{
	return sqrt(DASqr(point1.x - point2.x) + DASqr(point1.y - point2.y));
}


CG_INLINE CGSize CGPointOffsetToPoint(CGPoint point1, CGPoint point2)
{
	return CGSizeMake(point2.x - point1.x, point2.y - point1.y);
}


CG_INLINE CGPoint CGPointIntervalCenterToPoint(CGPoint point1, CGPoint point2)
{
	return CGPointMake((point1.x + point2.x) / 2, (point1.y + point2.y) / 2);
}


CG_INLINE CGPoint CGPointOffset(CGPoint point, CGSize offset)
{
	point.x += offset.width;
	point.y += offset.height;
	return point;
}


CG_INLINE CGPoint CGPointMultiply(CGPoint point, CGFloat value)
{
	point.x *= value;
	point.y *= value;
	return point;
}



#pragma mark CGSize


CG_INLINE CGSize CGSizeIntegral(CGSize size)
{
	size.width = (CGFloat)(NSInteger) size.width;
	size.height = (CGFloat)(NSInteger) size.height;
	return size;
}


CG_INLINE CGSize CGSizeMultiply(CGSize size, CGFloat value)
{
	size.width *= value;
	size.height *= value;
	return size;
}


CG_INLINE CGSize CGSizeAddSize(CGSize size1, CGSize size2)
{
	size1.width += size2.width;
	size1.height += size2.height;
	return size1;
}


CG_INLINE CGSize CGSizeEdgeInsets(CGSize size, UIEdgeInsets edgeInsets)
{
	size.width -= edgeInsets.left + edgeInsets.right;
	size.height -= edgeInsets.top + edgeInsets.bottom;
	return size;
}



#pragma mark CGRect


CG_INLINE CGPoint CGRectGetCenter(CGRect rect)
{
	rect.origin.x += rect.size.width / 2;
	rect.origin.y += rect.size.height / 2;
	return rect.origin;
}
