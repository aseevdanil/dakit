//
//  UIGeometry+DA.h
//  loveplanet
//
//  Created by da on 08.01.14.
//  Copyright (c) 2014 RBC. All rights reserved.
//



#pragma mark UIOffset


CG_INLINE CGSize CGSizeMakeFromUIOffset(UIOffset offset)
{
	return CGSizeMake(offset.horizontal, offset.vertical);
}


CG_INLINE UIOffset UIOffsetMakeFromCGSize(CGSize size)
{
	return UIOffsetMake(size.width, size.height);
}



#pragma mark UIEdgeInsets


CG_INLINE UIEdgeInsets UIEdgeInsetsIntegral(UIEdgeInsets insets)
{
	insets.top = (CGFloat)(NSInteger) insets.top;
	insets.left = (CGFloat)(NSInteger) insets.left;
	insets.bottom = (CGFloat)(NSInteger) insets.bottom;
	insets.right = (CGFloat)(NSInteger) insets.right;
	return insets;
}


CG_INLINE UIEdgeInsets UIEdgeInsetsInverse(UIEdgeInsets insets)
{
	insets.top = -insets.top;
	insets.left = -insets.left;
	insets.bottom = -insets.bottom;
	insets.right = -insets.right;
	return insets;
}


CG_INLINE UIEdgeInsets UIEdgeInsetsMultiply(UIEdgeInsets insets, CGFloat value)
{
	insets.top *= value;
	insets.left *= value;
	insets.bottom *= value;
	insets.right *= value;
	return insets;
}


CG_INLINE UIEdgeInsets UIEdgeInsetsUnion(UIEdgeInsets insets1, UIEdgeInsets insets2)
{
	insets1.top += insets2.top;
	insets1.left += insets2.left;
	insets1.bottom += insets2.bottom;
	insets1.right += insets2.right;
	return insets1;
}


CG_INLINE UIEdgeInsets UIEdgeInsetsMinus(UIEdgeInsets insets1, UIEdgeInsets insets2)
{
	insets1.top -= insets2.top;
	insets1.left -= insets2.left;
	insets1.bottom -= insets2.bottom;
	insets1.right -= insets2.right;
	return insets1;
}


CG_INLINE UIEdgeInsets UIEdgeInsetsBetweenRects(CGRect rect1, CGRect rect2)
{
	UIEdgeInsets insets = UIEdgeInsetsZero;
	insets.top = rect2.origin.y - rect1.origin.y;
	insets.left = rect2.origin.x - rect1.origin.x;
	insets.bottom = (rect1.origin.y + rect1.size.height) - (rect2.origin.y + rect2.size.height);
	insets.right = (rect1.origin.x + rect1.size.width) - (rect2.origin.x + rect2.size.width);
	return insets;
}


CG_INLINE UIEdgeInsets UIEdgeInsetsFromCGFloat(CGFloat value)
{
	UIEdgeInsets insets = {value, value, value, value};
	return insets;
}


CG_INLINE UIEdgeInsets UIEdgeInsetsFromCGSize(CGSize size)
{
	UIEdgeInsets insets = {size.height, size.width, size.height, size.width};
	return insets;
}
