//
//  PRHMathNumberFormatter.m
//  AffineTransformTest
//
//  Created by Peter Hosey on 2012-06-17.
//

#import "PRHMathNumberFormatter.h"
#import "DDMathParser.h"

@implementation PRHMathNumberFormatter

- (NSNumber *)numberFromString:(NSString *)string {
	return [string numberByEvaluatingString];
}
- (BOOL)getObjectValue:(id *)anObject forString:(NSString *)string errorDescription:(NSString **)outErrorDesc {
	NSError *__autoreleasing error = nil;
	NSNumber *number = [string numberByEvaluatingStringWithSubstitutions:nil error:&error];
	if (number) {
		*anObject = number;
		return YES;
	} else {
		if (outErrorDesc)
			*outErrorDesc = [error localizedDescription];
		return NO;
	}
}

@end
