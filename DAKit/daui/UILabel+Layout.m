//
//  UILabel+Layout.m
//  dakit
//
//  Created by da on 29.01.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "UILabel+Layout.h"



@implementation UILabel (Layout)


static BOOL UILabelLayout_Initialized = NO;
static UILabel *UILabelLayout_MeasuringLabel = nil;


+ (UILabel*)UILabelLayout_MeasuringLabel
{
	if (!UILabelLayout_MeasuringLabel)
	{
		UILabelLayout_MeasuringLabel = [[UILabel alloc] init];
		UILabelLayout_MeasuringLabel.hidden = YES;
	}
	if (!UILabelLayout_Initialized)
	{
		UILabelLayout_Initialized = YES;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UILabelLayout_MemoryWarningNotification:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
	}
	return UILabelLayout_MeasuringLabel;
}


+ (void)UILabelLayout_MemoryWarningNotification:(NSNotification*)notification
{
	UILabelLayout_MeasuringLabel = nil;
}


+ (CGSize)sizeForWidth:(CGFloat)viewWidth withText:(NSString*)text numberOfLines:(NSUInteger)numberOfLines font:(UIFont*)font
{
	UILabel *measuringLabel = [self UILabelLayout_MeasuringLabel];
	measuringLabel.font = font;
	measuringLabel.numberOfLines = numberOfLines;
	measuringLabel.text = text;
	return !text || text.length == 0 ? CGSizeZero : [measuringLabel sizeThatFits:CGSizeMake(viewWidth, CGFLOAT_MAX)];
}


+ (CGSize)sizeForWidth:(CGFloat)viewWidth withAttributedText:(NSAttributedString*)attributedText numberOfLines:(NSUInteger)numberOfLines font:(UIFont*)font
{
	UILabel *measuringLabel = [self UILabelLayout_MeasuringLabel];
	measuringLabel.font = font;
	measuringLabel.numberOfLines = numberOfLines;
	measuringLabel.attributedText = attributedText;
	return !attributedText || attributedText.length == 0 ? CGSizeZero : [measuringLabel sizeThatFits:CGSizeMake(viewWidth, CGFLOAT_MAX)];
}


+ (CGFloat)heightForNumberOfLines:(NSUInteger)numberOfLines font:(UIFont *)font
{
	if (numberOfLines == 0)
		return 0.;
	
	NSMutableString *text = [[NSMutableString alloc] initWithString:@"X"];
	for (NSUInteger i = 1; i < numberOfLines; ++i)
		[text appendString:@"\nX"];
	return [self sizeForWidth:100. withText:text numberOfLines:numberOfLines font:font].height;
}


@end
