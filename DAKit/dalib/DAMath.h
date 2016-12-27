//
//  DAMath.h
//  dakit
//
//  Created by da on 24.02.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>



NS_INLINE CGFloat DABound(CGFloat value, CGFloat bound_min, CGFloat bound_max)
{
	if (value < bound_min)
		value = bound_min;
	else if (value > bound_max)
		value = bound_max;
	return value;
}


NS_INLINE CGFloat DASqr(CGFloat x)
{
	return x * x;
}


NS_INLINE CGFloat DADistance(CGPoint point1, CGPoint point2)
{
	return sqrt(DASqr(point1.x - point2.x) + DASqr(point1.y - point2.y));
}


NS_INLINE CGFloat DADegreesToRadians(CGFloat degrees)
{
	return degrees * (M_PI / 180.);
}


NS_INLINE CGFloat DARadiansToDegrees(CGFloat radians)
{
	return radians / (M_PI / 180.);
}


#define DARAND_MAX	RAND_MAX


NS_INLINE long DARandom()
{
	static BOOL init = NO;
	if (!init)
	{
		srandom((unsigned int) time(NULL));
		init = YES;
	}
	return random();
}


NS_INLINE CGFloat DARandomF(CGFloat a, CGFloat b)
{
	return ((CGFloat) DARandom() / DARAND_MAX) * (b - a) + a;
}
