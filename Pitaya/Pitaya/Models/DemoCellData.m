//
//  DemoCellItem.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/18.
//

#import "DemoCellData.h"

@implementation DemoCellData

+ (instancetype)initWithTitle:(NSString *)title andVcCreator:(VcCreatorBlock)vcCreator {
    DemoCellData *obj = [[self alloc] init];
    if (obj) {
        obj.title = title;
        obj.vcCreator = vcCreator;
    }
    return obj;
}

@end
