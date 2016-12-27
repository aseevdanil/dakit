//
//  UIImage+Converting.h
//  dakit
//
//  Created by da on 02.02.11.
//  Copyright 2011 Aseev Danil. All rights reserved.
//

#import "UIImage+Converting.h"



CGSize UIImageResizedImageSize(CGSize originalSize, CGSize resizeSize, UIImageResizeScale resizeScale, BOOL cropped)
{
	if (CGSizeEqualToSize(originalSize, CGSizeZero) || CGSizeEqualToSize(resizeSize, CGSizeZero))
		return CGSizeZero;
	
	if (resizeScale == UIImageResizeScaleFill)
		return resizeSize;

	CGFloat ratio = 1.;
	switch (resizeScale)
	{
		case UIImageResizeScaleAspectFill:
		{
			if (cropped)
				return resizeSize;
			CGFloat horizontalRatio = originalSize.width / resizeSize.width;
			CGFloat verticalRatio = originalSize.height / resizeSize.height;
			ratio = MIN(horizontalRatio, verticalRatio);
		}
			break;
		case UIImageResizeScaleAspectFit:
		default:
		{
			if (!cropped)
				return resizeSize;
			CGFloat horizontalRatio = originalSize.width / resizeSize.width;
			CGFloat verticalRatio = originalSize.height / resizeSize.height;
			ratio = MAX(horizontalRatio, verticalRatio);
		}
			break;
	}
	resizeSize.width = originalSize.width / ratio;
	resizeSize.height = originalSize.height / ratio;
	return resizeSize;
}



@implementation UIImage (Converting)


- (UIImage*)croppedImage:(CGRect)cropRect
{
	CGSize imageSize = self.size;
	if (CGPointEqualToPoint(cropRect.origin, CGPointZero) && CGSizeEqualToSize(cropRect.size, imageSize))
		return self;
	
	CGFloat imageScale = self.scale;
	imageSize.width *= imageScale;
	imageSize.height *= imageScale;
	UIImageOrientation imageOrientation = self.imageOrientation;
	CGAffineTransform transform = CGAffineTransformIdentity;
	switch (imageOrientation)
	{
		case UIImageOrientationDown:
			transform = CGAffineTransformRotate(transform, -M_PI);
			transform = CGAffineTransformTranslate(transform, -imageSize.width, -imageSize.height);
			break;
		case UIImageOrientationLeft:
			transform = CGAffineTransformRotate(transform, M_PI_2);
			transform = CGAffineTransformTranslate(transform, 0., -imageSize.height);
			break;
		case UIImageOrientationRight:
			transform = CGAffineTransformRotate(transform, -M_PI_2);
			transform = CGAffineTransformTranslate(transform, -imageSize.width, 0.);
			break;
		case UIImageOrientationUpMirrored:
			transform = CGAffineTransformScale(transform, -1, 0);
			transform = CGAffineTransformTranslate(transform, -imageSize.width, 0.);
			break;
		case UIImageOrientationDownMirrored:
			transform = CGAffineTransformRotate(transform, -M_PI);
			transform = CGAffineTransformTranslate(transform, 0., -imageSize.height);
			transform = CGAffineTransformScale(transform, -1, 1);
			break;
		case UIImageOrientationLeftMirrored:
			transform = CGAffineTransformRotate(transform, M_PI_2);
			transform = CGAffineTransformTranslate(transform, -imageSize.width, -imageSize.height);
			transform = CGAffineTransformScale(transform, -1, 1);
			break;
		case UIImageOrientationRightMirrored:
			transform = CGAffineTransformRotate(transform, -M_PI_2);
			transform = CGAffineTransformScale(transform, -1, 1);
			break;
		case UIImageOrientationUp:
		default:
			break;
	}
	transform = CGAffineTransformScale(transform, imageScale, imageScale);
	cropRect = CGRectApplyAffineTransform(cropRect, transform);
	cropRect = CGRectIntegral(cropRect);
	
	CGImageRef cgimage = CGImageCreateWithImageInRect(self.CGImage, cropRect);
	UIImage *image = nil;
	if (cgimage)
	{
		image = [[UIImage alloc] initWithCGImage:cgimage scale:imageScale orientation:imageOrientation];
		CGImageRelease(cgimage);
	}
	return image;
}


- (UIImage*)resizedImage:(CGSize)resizeSize resizeScale:(UIImageResizeScale)resizeScale cropped:(BOOL)cropped
{
	CGSize imageSize = self.size;
	CGSize croppedResizeSize = UIImageResizedImageSize(imageSize, resizeSize, resizeScale, YES);
	CGSize uncroppedResizeSize = UIImageResizedImageSize(imageSize, resizeSize, resizeScale, NO);
	CGSize resizedBitmapSize, resizedImageSize;
	if (cropped)
	{
		resizedBitmapSize = croppedResizeSize;
		resizedImageSize = CGSizeEqualToSize(resizeSize, resizedBitmapSize) ? uncroppedResizeSize : croppedResizeSize;
	}
	else
	{
		resizedBitmapSize = uncroppedResizeSize;
		resizedImageSize = CGSizeEqualToSize(resizeSize, resizedBitmapSize) ? croppedResizeSize : uncroppedResizeSize;
	}
	if (CGSizeEqualToSize(resizedBitmapSize, imageSize) && CGSizeEqualToSize(resizedImageSize, imageSize))
		return self;
	
	CGFloat imageScale = self.scale;
	resizedBitmapSize.width *= imageScale;
	resizedBitmapSize.height *= imageScale;
	resizedImageSize.width *= imageScale;
	resizedImageSize.height *= imageScale;
	
	BOOL transposed = NO;
	UIImageOrientation imageOrientation = self.imageOrientation;
	switch (imageOrientation)
	{
		case UIImageOrientationLeft:
		case UIImageOrientationRight:
		case UIImageOrientationLeftMirrored:
		case UIImageOrientationRightMirrored:
			transposed = YES;
			break;
		case UIImageOrientationUp:
		case UIImageOrientationDown:
		case UIImageOrientationUpMirrored:
		case UIImageOrientationDownMirrored:
        default:
			break;
	}
	if (transposed)
	{
		CGFloat t = resizedBitmapSize.width;
		resizedBitmapSize.width = resizedBitmapSize.height;
		resizedBitmapSize.height = t;
		t = resizedImageSize.width;
		resizedImageSize.width = resizedImageSize.height;
		resizedImageSize.height = t;
	}
	
	CGRect resizeRect = CGRectZero;
	resizeRect.size = resizedImageSize;
	resizeRect.origin.x += (resizedBitmapSize.width - resizeRect.size.width) / 2;
	resizeRect.origin.y += (resizedBitmapSize.height - resizeRect.size.height) / 2;
	
	CGImageRef cgimage = self.CGImage;
	if (!cgimage)
		return nil;
	
	CGImageRef resCGImage = NULL;
	void *data = NULL;
	CGContextRef context = NULL;
	
	size_t bytesPerPixel = (CGImageGetBitsPerPixel(cgimage) + 7) / 8;
	data = calloc(resizedBitmapSize.width * resizedBitmapSize.height, bytesPerPixel);
	if (!data)
		goto cleanup;
	
	CGColorSpaceRef colorSpace = CGImageGetColorSpace(cgimage);
	CGBitmapInfo cgimageBitmapInfo = CGImageGetBitmapInfo(cgimage);
	CGImageAlphaInfo alphaInfo = cgimageBitmapInfo & kCGBitmapAlphaInfoMask;
	BOOL nonAlpha = alphaInfo == kCGImageAlphaNone || alphaInfo == kCGImageAlphaNoneSkipFirst || alphaInfo == kCGImageAlphaNoneSkipLast;
	// CGBitmapContextCreate doesn't support kCGImageAlphaNone with RGB.
	// https://developer.apple.com/library/mac/#qa/qa1037/_index.html
	if (alphaInfo == kCGImageAlphaNone && CGColorSpaceGetNumberOfComponents(colorSpace) > 1)
	{
		cgimageBitmapInfo &= ~kCGBitmapAlphaInfoMask;
		cgimageBitmapInfo |= kCGImageAlphaNoneSkipFirst;
	}
	// Some PNGs tell us they have alpha but only 3 components. Odd.
	else if (!nonAlpha && CGColorSpaceGetNumberOfComponents(colorSpace) == 3)
	{
		cgimageBitmapInfo &= ~kCGBitmapAlphaInfoMask;
		cgimageBitmapInfo |= kCGImageAlphaPremultipliedFirst;
	}
	size_t bitsPerComponent = CGImageGetBitsPerComponent(cgimage);
	resizedBitmapSize = CGSizeIntegral(resizedBitmapSize);
	context = CGBitmapContextCreate(data, resizedBitmapSize.width, resizedBitmapSize.height, bitsPerComponent, bytesPerPixel * resizedBitmapSize.width, colorSpace, cgimageBitmapInfo);
	if (!context)
		goto cleanup;

	CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
	CGContextDrawImage(context, resizeRect, cgimage);

	resCGImage = CGBitmapContextCreateImage(context);
	
cleanup:
	if (context)
		CGContextRelease(context);
	if (data)
		free(data);
	
	UIImage *result = nil;
	if (resCGImage)
	{
		result = [[UIImage alloc] initWithCGImage:resCGImage scale:imageScale orientation:imageOrientation];
		CGImageRelease(resCGImage);
	}
	return result;
}


- (UIImage*)rotatedImage:(UIImageRotation)rotation mirrored:(BOOL)mirrored
{
	if (rotation == UIImageRotationNone && !mirrored)
		return self;
	
	CGSize imageSize = self.size;
	CGFloat imageScale = self.scale;
	
	CGSize bitmapSize = imageSize;
	bitmapSize.width *= imageScale;
	bitmapSize.height *= imageScale;
	BOOL transposed = NO;
	UIImageOrientation imageOrientation = self.imageOrientation;
	switch (imageOrientation)
	{
		case UIImageOrientationLeft:
		case UIImageOrientationRight:
		case UIImageOrientationLeftMirrored:
		case UIImageOrientationRightMirrored:
			transposed = YES;
			break;
		case UIImageOrientationUp:
		case UIImageOrientationDown:
		case UIImageOrientationUpMirrored:
		case UIImageOrientationDownMirrored:
		default:
			break;
	}
	if (transposed)
	{
		CGFloat t = bitmapSize.width;
		bitmapSize.width = bitmapSize.height;
		bitmapSize.height = t;
	}
	
	CGSize rotatedBitmapSize = bitmapSize;
	CGAffineTransform transform = CGAffineTransformIdentity;
	switch (rotation)
	{
		case UIImageRotationDown:
			if  (mirrored)
			{
				transform = CGAffineTransformScale(transform, -1., 1.);
				transform = CGAffineTransformRotate(transform, M_PI);
				transform = CGAffineTransformTranslate(transform, 0., -bitmapSize.height);
			}
			else
			{
				transform = CGAffineTransformRotate(transform, M_PI);
				transform = CGAffineTransformTranslate(transform, -bitmapSize.width, -bitmapSize.height);
			}
			transposed = NO;
			break;
			
		case UIImageRotationLeft:
			if  (mirrored)
			{
				transform = CGAffineTransformScale(transform, -1., 1.);
				transform = CGAffineTransformRotate(transform, -M_PI_2);
				transform = CGAffineTransformTranslate(transform, -bitmapSize.width, -bitmapSize.height);
			}
			else
			{
				transform = CGAffineTransformRotate(transform, M_PI_2);
				transform = CGAffineTransformTranslate(transform, 0., -bitmapSize.height);
			}
			transposed = YES;
			break;
			
		case UIImageRotationRight:
			if  (mirrored)
			{
				transform = CGAffineTransformScale(transform, -1., 1.);
				transform = CGAffineTransformRotate(transform, M_PI_2);
			}
			else
			{
				transform = CGAffineTransformRotate(transform, -M_PI_2);
				transform = CGAffineTransformTranslate(transform, -bitmapSize.width, 0.);
			}
			transposed = YES;
			break;
			
		case UIImageRotationNone:
		default:
			if (mirrored)
			{
				transform = CGAffineTransformScale(transform, -1., 1.);
				transform = CGAffineTransformTranslate(transform, -bitmapSize.width, 0.);
			}
			transposed = NO;
			break;
	}
	if (transposed)
	{
		CGFloat t = rotatedBitmapSize.width;
		rotatedBitmapSize.width = rotatedBitmapSize.height;
		rotatedBitmapSize.height = t;
	}
	
	CGImageRef cgimage = self.CGImage;
	if (!cgimage)
		return nil;
	
	CGImageRef resCGImage = NULL;
	CGColorSpaceRef colorSpace = NULL;
	CGContextRef context = NULL;
	
	colorSpace = CGColorSpaceCreateDeviceRGB();
	if (!colorSpace)
		goto cleanup;
	
	rotatedBitmapSize = CGSizeIntegral(rotatedBitmapSize);
	CGBitmapInfo cgimageBitmapInfo = CGImageGetBitmapInfo(cgimage);
	CGImageAlphaInfo alphaInfo = cgimageBitmapInfo & kCGBitmapAlphaInfoMask;
	BOOL nonAlpha = alphaInfo == kCGImageAlphaNone || alphaInfo == kCGImageAlphaNoneSkipFirst || alphaInfo == kCGImageAlphaNoneSkipLast;
	// CGBitmapContextCreate doesn't support kCGImageAlphaNone with RGB.
	// https://developer.apple.com/library/mac/#qa/qa1037/_index.html
	if (alphaInfo == kCGImageAlphaNone && CGColorSpaceGetNumberOfComponents(colorSpace) > 1)
	{
		cgimageBitmapInfo &= ~kCGBitmapAlphaInfoMask;
		cgimageBitmapInfo |= kCGImageAlphaNoneSkipFirst;
	}
	// Some PNGs tell us they have alpha but only 3 components. Odd.
	else if (!nonAlpha && CGColorSpaceGetNumberOfComponents(colorSpace) == 3)
	{
		cgimageBitmapInfo &= ~kCGBitmapAlphaInfoMask;
		cgimageBitmapInfo |= kCGImageAlphaPremultipliedFirst;
	}
	context = CGBitmapContextCreate(NULL, rotatedBitmapSize.width, rotatedBitmapSize.height, CGImageGetBitsPerComponent(cgimage), 0, colorSpace, cgimageBitmapInfo);
	if (!context)
		goto cleanup;
	
	CGContextConcatCTM(context, transform);
	CGRect rect = {.origin = CGPointZero, .size = bitmapSize};
	CGContextDrawImage(context, rect, cgimage);
	
	resCGImage = CGBitmapContextCreateImage(context);
	
cleanup:
	if (context)
		CGContextRelease(context);
	if (colorSpace)
		CGColorSpaceRelease(colorSpace);
	
	UIImage *result = nil;
	if (resCGImage)
	{
		result = [[UIImage alloc] initWithCGImage:resCGImage scale:imageScale orientation:imageOrientation];
		CGImageRelease(resCGImage);
	}
	return result;
}


@end
