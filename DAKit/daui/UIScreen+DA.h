//
//  UIScreen+DA.h
//  dakit
//
//  Created by da on 20.11.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



CGFloat UIScreenScale();
CGFloat UIScreenPixel();


#define SCREEN_LENGTH(l, round_up)	(((round_up) ? ceil((l) * UIScreenScale()) : floor((l) * UIScreenScale())) / UIScreenScale())
#define SCREEN_SIZE(s, round_up)	(s.width = (((round_up) ? ceil((s.width) * UIScreenScale()) : floor((s.width) * UIScreenScale())) / UIScreenScale()), s.height = (((round_up) ? ceil((s.height) * UIScreenScale()) : floor((s.height) * UIScreenScale())) / UIScreenScale()));

