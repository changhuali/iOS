//
//  FractionSub.m
//  OCShare
//
//  Created by hjmac04 on 2022/5/25.
//

#import "FractionSub.h"

void fun(void) {
  NSLog(@"test");
}

@implementation FractionSub

-(int) print:(int) n
{
    int a = 1;
    int *b = &a;
    *b = 2;
    NSLog(@"sub %d", a);
    return 1;
}

@end
