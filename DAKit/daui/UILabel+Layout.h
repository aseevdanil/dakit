//
//  UILabel+Layout.h
//  dakit
//
//  Created by da on 29.01.13.
//  Copyright (c) 2013 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UILabel (Layout)

+ (CGSize)sizeForWidth:(CGFloat)viewWidth withText:(NSString*)text numberOfLines:(NSUInteger)numberOfLines font:(UIFont*)font;
+ (CGSize)sizeForWidth:(CGFloat)viewWidth withAttributedText:(NSAttributedString*)attributedText numberOfLines:(NSUInteger)numberOfLines font:(UIFont*)font;
+ (CGFloat)heightForNumberOfLines:(NSUInteger)numberOfLines font:(UIFont *)font;

@end
