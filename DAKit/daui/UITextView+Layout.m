//
//  UITextView+Layout.m
//  dakit
//
//  Created by da on 29.01.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import "UITextView+Layout.h"



@implementation UITextView (Layout)


static BOOL UITextViewLayout_Initialized = NO;
static UITextView *UITextViewLayout_MeasuringTextView = nil;
static UIEdgeInsets UITextViewLayout_DefaultTextContainerInset = {0., 0., 0., 0.};


+ (UITextView*)UITextViewLayout_MeasuringTextView
{
	if (!UITextViewLayout_MeasuringTextView)
	{
		UITextViewLayout_MeasuringTextView = [[UITextView alloc] init];
		UITextViewLayout_MeasuringTextView.hidden = YES;
		UITextViewLayout_DefaultTextContainerInset = UITextViewLayout_MeasuringTextView.textContainerInset;
	}
	if (!UITextViewLayout_Initialized)
	{
		UITextViewLayout_Initialized = YES;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UITextViewLayout_MemoryWarningNotification:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
	}
	return UITextViewLayout_MeasuringTextView;
}


+ (void)UITextViewLayout_MemoryWarningNotification:(NSNotification*)notification
{
	UITextViewLayout_MeasuringTextView = nil;
}


+ (UIEdgeInsets)defaultTextContainerInset
{
	[self UITextViewLayout_MeasuringTextView];
	return UITextViewLayout_DefaultTextContainerInset;
}


+ (CGFloat)heightForWidth:(CGFloat)viewWidth withText:(NSString*)text font:(UIFont*)font textContainerInset:(UIEdgeInsets)textContainerInset
{
	UITextView *measuringTextView = [self UITextViewLayout_MeasuringTextView];
	measuringTextView.font = font;
	measuringTextView.text = text;
	measuringTextView.textContainerInset = textContainerInset;
	return text && text.length > 0 ? ceil([measuringTextView sizeThatFits:CGSizeMake(viewWidth, CGFLOAT_MAX)].height) : 0.;
}


+ (CGFloat)heightForWidth:(CGFloat)viewWidth withText:(NSString*)text font:(UIFont*)font
{
	return [self heightForWidth:viewWidth withText:text font:font textContainerInset:[self defaultTextContainerInset]];
}


+ (CGFloat)heightForNumberOfLines:(NSUInteger)numberOfLines font:(UIFont *)font textContainerInset:(UIEdgeInsets)textContainerInset
{
	if (numberOfLines == 0)
		return 0.;
	
	NSMutableString *text = [NSMutableString stringWithString:@"X"];
	for (NSUInteger i = 1; i < numberOfLines; ++i)
		[text appendString:@"\nX"];
	return [self heightForWidth:100. withText:text font:font textContainerInset:textContainerInset];
}


+ (CGFloat)heightForNumberOfLines:(NSUInteger)numberOfLines font:(UIFont *)font
{
	return [self heightForNumberOfLines:numberOfLines font:font textContainerInset:[self defaultTextContainerInset]];
}


@end
