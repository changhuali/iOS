//
//  DemoCellSection.m
//  Pitaya
//
//  Created by hjmac04 on 2023/4/18.
//

#import "DemoSectionData.h"

@implementation DemoSectionData

+ (instancetype)initWithTitle:(NSString *)title andCellList:(NSArray<DemoCellData *> *)cellList {
    DemoSectionData *obj = [[self alloc] init];
    if (obj) {
        obj.title = title;
        obj.cellList = cellList;
    }
    return obj;
}

@end
