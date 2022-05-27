//
//  Fraction.h
//  OCShare
//
//  Created by hjmac04 on 2022/5/25.
//

#ifndef Fraction_h
#define Fraction_h

#import <Foundation/Foundation.h>

@interface Fraction: NSObject

-(void) setNumerator:(int)n;

-(void) setDenominator:(int)d;

-(void) setNumerator:(int)n andDenominator:(int)d;

-(void) print: (float) n;

@end

@interface Fraction (MathOps)

-(Fraction *) add: (Fraction *) f;
-(Fraction *) sub: (Fraction *) f;

@end

#endif /* Fraction_h */
