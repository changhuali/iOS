//
//  Fraction.m
//  OCShare
//
//  Created by hjmac04 on 2022/5/25.
//

#import "Fraction.h"

@implementation Fraction
{
@public
  int numerator;
  int denominator;
}

-(instancetype) init
{
    self = [super init];
    if (self) {
        NSLog(@"初始化中");
    }
    return self;
}

-(instancetype) initWith: (int)n :(int) d
{
    self = [super init];
    if (self) {
        [self setNumerator:n andDenominator:d];
    }
    return self;
}

-(void) setNumerator:(int)n
{
    numerator = n;
}

-(void) setDenominator:(int)d
{
    denominator = d;
}

-(void) setNumerator:(int)n andDenominator:(int)d
{
    numerator = n;
    denominator = d;
}

-(void) print:(float) n
{
    NSLog(@"%i/%i %.2f", numerator, denominator, n);
}

@end

@implementation Fraction (MathOps)

-(Fraction *) add: (Fraction *) f
{
    NSLog(@"add");
    return self;
}

-(Fraction *) sub: (Fraction *) f
{
    return self;
}

@end
