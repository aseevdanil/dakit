//
//  CATextLayer+Layout.m
//  dakit
//
//  Created by da on 21.04.15.
//  Copyright (c) 2015 Aseev Danil. All rights reserved.
//

#import "CATextLayer+Layout.h"



@implementation CATextLayer (Layout)


static BOOL CATextLayerLayout_Initialized = NO;
static CATextLayer *CATextLayerLayout_MeasuringTextLayer = nil;


+ (CATextLayer*)CATextLayerLayout_MeasuringTextLayer
{
	if (!CATextLayerLayout_MeasuringTextLayer)
	{
		CATextLayerLayout_MeasuringTextLayer = [[CATextLayer alloc] init];
		CATextLayerLayout_MeasuringTextLayer.hidden = YES;
	}
	if (!CATextLayerLayout_Initialized)
	{
		CATextLayerLayout_Initialized = YES;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CATextLayerLayout_MemoryWarningNotification:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
	}
	return CATextLayerLayout_MeasuringTextLayer;
}


+ (void)CATextLayerLayout_MemoryWarningNotification:(NSNotification*)notification
{
	CATextLayerLayout_MeasuringTextLayer = nil;
}


+ (CGSize)sizeWithString:(NSString*)string font:(CFTypeRef)font :(CGFloat)fontSize
{
	CATextLayer *measuringTextLayer = [self CATextLayerLayout_MeasuringTextLayer];
	measuringTextLayer.font = font;
	measuringTextLayer.fontSize = fontSize;
	measuringTextLayer.string = string;
	return [measuringTextLayer preferredFrameSize];
}


+ (CGSize)sizeWithAttributedString:(NSAttributedString*)attributedString
{
	CATextLayer *measuringTextLayer = [self CATextLayerLayout_MeasuringTextLayer];
	measuringTextLayer.string = attributedString;
	return [measuringTextLayer preferredFrameSize];
}


@end
