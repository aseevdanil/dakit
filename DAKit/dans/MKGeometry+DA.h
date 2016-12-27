//
//  MKGeometry+DA.h
//  DAKit
//
//  Created by da on 27.12.16.
//  Copyright © 2016 Aseev Danil. All rights reserved.
//

#import <MapKit/MKGeometry.h>



NS_INLINE double MKDistance(MKMapPoint point1, MKMapPoint point2)
{
	return sqrt(DASqr(point1.x - point2.x) + DASqr(point1.y - point2.y));
}
