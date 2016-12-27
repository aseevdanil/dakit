//
//  CATextLayer+Layout.h
//  dakit
//
//  Created by da on 21.04.15.
//  Copyright (c) 2015 Aseev Danil. All rights reserved.
//



@interface CATextLayer (Layout)

+ (CGSize)sizeWithString:(NSString*)string font:(CFTypeRef)font :(CGFloat)fontSize;
+ (CGSize)sizeWithAttributedString:(NSAttributedString*)attributedString;

@end
