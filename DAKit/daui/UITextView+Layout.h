//
//  UITextView+Layout.h
//  dakit
//
//  Created by da on 29.01.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UITextView (Layout)

+ (CGFloat)heightForWidth:(CGFloat)viewWidth withText:(NSString*)text font:(UIFont*)font;
+ (CGFloat)heightForWidth:(CGFloat)viewWidth withText:(NSString*)text font:(UIFont*)font textContainerInset:(UIEdgeInsets)textContainerInset;
+ (CGFloat)heightForNumberOfLines:(NSUInteger)numberOfLines font:(UIFont *)font;
+ (CGFloat)heightForNumberOfLines:(NSUInteger)numberOfLines font:(UIFont *)font textContainerInset:(UIEdgeInsets)textContainerInset;
+ (UIEdgeInsets)defaultTextContainerInset;

@end
