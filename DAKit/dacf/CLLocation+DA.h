//
//  CLLocation+DA.h
//  dakit
//
//  Created by da on 17.02.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>



FOUNDATION_STATIC_INLINE BOOL CLLocationCoordinate2DEqualToLocationCoordinate2D(CLLocationCoordinate2D coordinate1, CLLocationCoordinate2D coordinate2)
{
	return coordinate1.latitude == coordinate2.latitude && coordinate1.longitude == coordinate2.longitude;
}
