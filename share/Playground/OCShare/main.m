//
//  main.m
//  OCShare
//
//  Created by hjmac04 on 2022/5/25.
//

#import <Foundation/Foundation.h>

#define MAX_ARRAY_LENGTH 10

int main(void) {
#if MAX_ARRAY_LENGTH == 20
    NSLog(@"Ok");
#else
    NSLog(@"No");
#endif
    return 1;
}
