//
//  UIImage+Converting.h
//  dakit
//
//  Created by da on 02.02.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, UIImageResizeScale)
{
	UIImageResizeScaleFill,			// просто растягивает изображение до указанного размера, пропорции не сохраняются, размер конечного изображения соответствует запрашиваемому
	UIImageResizeScaleAspectFit,	// преобразует изображение с сохранением пропорций так, чтобы оно целиком вписалось в указанный размер, при этом конечный размер может оказаться меньше запрашиваемого
	UIImageResizeScaleAspectFill,	// преобразует изображение с сохранением пропорций так, чтобы оно целиком заполнило весь указанный размер, при этом конечный размер может оказаться больше запрашиваемого
};


typedef NS_ENUM(NSUInteger, UIImageRotation)
{	// направление вращения говорит о том, где будет верхняя грань картинки после поворота
	UIImageRotationNone,
	UIImageRotationDown,	// 180 deg rotation
	UIImageRotationLeft,	// 90 deg CCW
	UIImageRotationRight,	// 90 deg CW
};


CGSize UIImageResizedImageSize(CGSize originalSize, CGSize resizeSize, UIImageResizeScale resizeScale, BOOL cropped);


@interface UIImage (Converting)

- (UIImage*)croppedImage:(CGRect)cropRect;
- (UIImage*)resizedImage:(CGSize)resizeSize resizeScale:(UIImageResizeScale)resizeScale cropped:(BOOL)cropped;
- (UIImage*)rotatedImage:(UIImageRotation)rotation mirrored:(BOOL)mirrored;

@end
