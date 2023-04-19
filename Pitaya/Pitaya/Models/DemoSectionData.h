//
//  DemoCellSection.h
//  Pitaya
//
//  Created by hjmac04 on 2023/4/18.
//

#import <Foundation/Foundation.h>
#import "DemoCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface DemoSectionData : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic) NSArray<DemoCellData *> *cellList;

+ (instancetype)initWithTitle:(NSString *)title andCellList:(NSArray<DemoCellData *> *)cellList;

@end

NS_ASSUME_NONNULL_END
