//
//  NSCalendar+DA.m
//  dakit
//
//  Created by da on 21.12.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import "NSCalendar+DA.h"



@implementation NSCalendar (DA)


- (NSDate*)dateFromDay:(NSDate*)day andTime:(NSDate*)time
{
	NSDateComponents *dayComponents = [self components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:day];
	NSDateComponents *timeComponents = [self components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:time];
	NSDateComponents *fullComponents = [[NSDateComponents alloc] init];
	[fullComponents setYear:[dayComponents year]];
	[fullComponents setMonth:[dayComponents month]];
	[fullComponents setDay:[dayComponents day]];
	[fullComponents setHour:[timeComponents hour]];
	[fullComponents setMinute:[timeComponents minute]];
	[fullComponents setSecond:[timeComponents second]];
	return [self dateFromComponents:fullComponents];
}


- (void)getDay:(NSDate**)pday andTime:(NSDate**)ptime fromDate:(NSDate*)date
{
	if (pday)
		*pday = [self dateFromComponents:[self components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date]];
	if (ptime)
		*ptime = [self dateFromComponents:[self components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date]];
}


- (NSDate*)dayFromDate:(NSDate*)date
{
	return [self dateFromComponents:[self components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date]];
}


- (NSDate*)timeFromDate:(NSDate*)date
{
	return [self dateFromComponents:[self components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date]];
}


- (NSDate*)roundedDate:(NSDate*)date toComponent:(NSCalendarUnit)component
{
	const NSCalendarUnit components[] = { NSCalendarUnitEra, NSCalendarUnitYear, NSCalendarUnitMonth, NSCalendarUnitDay, NSCalendarUnitHour, NSCalendarUnitMinute, NSCalendarUnitSecond };
	NSCalendarUnit unitFlags = 0;
	for (NSUInteger i = 0; i < sizeof(components) / sizeof(components[0]); ++i)
	{
		unitFlags |= components[i];
		if (component == components[i])
			break;
	}
	return [self dateFromComponents:[self components:unitFlags fromDate:date]];
}


- (NSDate*)cutDate:(NSDate*)date withComponent:(NSCalendarUnit)component
{
	const NSCalendarUnit components[] = { NSCalendarUnitEra, NSCalendarUnitYear, NSCalendarUnitMonth, NSCalendarUnitDay, NSCalendarUnitHour, NSCalendarUnitMinute, NSCalendarUnitSecond };
	NSCalendarUnit unitFlags = 0;
	for (NSInteger i = sizeof(components) / sizeof(components[0]) - 1; i >= 0; --i)
	{
		unitFlags |= components[i];
		if (component == components[i])
			break;
	}
	return [self dateFromComponents:[self components:unitFlags fromDate:date]];
}


@end
