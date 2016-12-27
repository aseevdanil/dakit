//
//  NSCalendar+DA.h
//  dakit
//
//  Created by da on 21.12.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSCalendar (DA)

- (NSDate*)dateFromDay:(NSDate*)day andTime:(NSDate*)time;
- (void)getDay:(NSDate**)pday andTime:(NSDate**)ptime fromDate:(NSDate*)date;
- (NSDate*)dayFromDate:(NSDate*)date;
- (NSDate*)timeFromDate:(NSDate*)date;

- (NSDate*)roundedDate:(NSDate*)date toComponent:(NSCalendarUnit)component;
- (NSDate*)cutDate:(NSDate*)date withComponent:(NSCalendarUnit)component;
// component: NSCalendarUnitEra, NSCalendarUnitYear, NSCalendarUnitMonth, NSCalendarUnitDay, NSCalendarUnitHour, NSCalendarUnitMinute, NSCalendarUnitSecond

@end
