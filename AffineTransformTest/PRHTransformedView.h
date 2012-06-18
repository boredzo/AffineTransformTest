//
//  PRHTransformedView.h
//  AffineTransformTest
//
//  Created by Peter Hosey on 2012-06-17.
//

@interface PRHTransformedView : NSView

@property CGAffineTransform transformMatrix;

@property(nonatomic) CGFloat transformA;
@property(nonatomic) CGFloat transformB;
@property(nonatomic) CGFloat transformC;
@property(nonatomic) CGFloat transformD;
@property(nonatomic) CGFloat transformTX;
@property(nonatomic) CGFloat transformTY;

@end
