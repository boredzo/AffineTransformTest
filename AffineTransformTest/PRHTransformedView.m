//
//  PRHTransformedView.m
//  AffineTransformTest
//
//  Created by Peter Hosey on 2012-06-17.
//

#import "PRHTransformedView.h"

@implementation PRHTransformedView

@synthesize transformMatrix = _transformMatrix;

- (id)initWithFrame:(NSRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.transformMatrix = CGAffineTransformIdentity;
	}
	return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
	CGRect bounds = [self bounds];
	CGFloat halfWidth = bounds.size.width / 2.0;
	CGFloat halfHeight = bounds.size.height / 2.0;

	CGContextTranslateCTM(context, halfWidth, halfHeight);
	CGContextConcatCTM(context, self.transformMatrix);

	CGContextSaveGState(context);
	CGContextMoveToPoint(context, halfWidth * -0.5, 0.0);
	CGContextAddLineToPoint(context, halfWidth * +0.5, 0.0);
	CGContextMoveToPoint(context, 0.0, halfHeight * -0.5);
	CGContextAddLineToPoint(context, 0.0, halfHeight * +0.5);
	CGContextStrokePath(context);

	CGColorRef blueColor = CGColorCreateGenericRGB(0.0, 0.0, 1.0, 1.0);
	CGContextSetStrokeColorWithColor(context, blueColor);
	CGColorRef purpleColor = CGColorCreateGenericRGB(1.0, 0.0, 1.0, 1.0);
	CGColorSpaceRef colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
	NSArray *colors = [NSArray arrayWithObjects:(__bridge_transfer id)purpleColor, (__bridge_transfer id)blueColor, nil];
	const CGFloat locations[2] = { 1.0, 0.0 };
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
	CGColorSpaceRelease(colorSpace);

	CGMutablePathRef path = CGPathCreateMutable();
	CGPathAddRect(path, /*transform*/ NULL, (CGRect){ CGPointZero, { halfWidth / 2.0, halfHeight / 2.0 } });

	CGContextAddPath(context, path);
	CGContextStrokePath(context);

	CGContextAddPath(context, path);
	CGContextClip(context);
	CGContextDrawLinearGradient(context, gradient, (CGPoint){ 0.0, halfHeight * -0.5 }, (CGPoint){ 0.0, halfHeight * 0.5 }, /*options*/0);

	CGPathRelease(path);
	CGGradientRelease(gradient);
}

- (CGFloat) transformA {
	return self.transformMatrix.a;
}
- (void) setTransformA:(CGFloat)transformA {
	CGAffineTransform temp = self.transformMatrix;
	temp.a = transformA;
	self.transformMatrix = temp;
	[self setNeedsDisplay:YES];
}
- (CGFloat) transformB {
	return self.transformMatrix.b;
}
- (void) setTransformB:(CGFloat)transformB {
	CGAffineTransform temp = self.transformMatrix;
	temp.b = transformB;
	self.transformMatrix = temp;
	[self setNeedsDisplay:YES];
}
- (CGFloat) transformC {
	return self.transformMatrix.c;
}
- (void) setTransformC:(CGFloat)transformC {
	CGAffineTransform temp = self.transformMatrix;
	temp.c = transformC;
	self.transformMatrix = temp;
	[self setNeedsDisplay:YES];
}
- (CGFloat) transformD {
	return self.transformMatrix.d;
}
- (void) setTransformD:(CGFloat)transformD {
	CGAffineTransform temp = self.transformMatrix;
	temp.d = transformD;
	self.transformMatrix = temp;
	[self setNeedsDisplay:YES];
}
- (CGFloat) transformTX {
	return self.transformMatrix.tx;
}
- (void) setTransformTX:(CGFloat)transformTX {
	CGAffineTransform temp = self.transformMatrix;
	temp.tx = transformTX;
	self.transformMatrix = temp;
	[self setNeedsDisplay:YES];
}
- (CGFloat) transformTY {
	return self.transformMatrix.ty;
}
- (void) setTransformTY:(CGFloat)transformTY {
	CGAffineTransform temp = self.transformMatrix;
	temp.ty = transformTY;
	self.transformMatrix = temp;
	[self setNeedsDisplay:YES];
}

@end
