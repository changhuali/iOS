//
//  FractionP.m
//  OCShare
//
//  Created by hjmac04 on 2022/5/25.
//

#import "FractionP.h"

@implementation FractionP
{
@public
    int a;
}
@synthesize numerator, denominator;

-(void) print
{
    NSLog(@"%i/%i", numerator, denominator);
    [self test];
}

-(void) test
{
    NSLog(@"test %d", self->a);
}

@end
