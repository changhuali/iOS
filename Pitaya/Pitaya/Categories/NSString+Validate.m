//
//  NSString+Validate.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/11.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

- (BOOL)cus_isPhone {
    NSString *pat = @"^1\\d{10}$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pat];
    return [pre evaluateWithObject:self];
}

- (BOOL)cus_isCode {
    NSString *pat = @"^\\d{6}$";
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:pat options:0 error:nil];
    NSArray *result = [exp matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return [result count] > 0;
}

@end
