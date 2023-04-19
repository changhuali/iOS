//
//  DemoCellItem.h
//  Pitaya
//
//  Created by hjmac04 on 2023/4/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIViewController * _Nonnull (^VcCreatorBlock)(void);

@interface DemoCellData : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic) VcCreatorBlock vcCreator;

+ (instancetype)initWithTitle:(NSString *)title andVcCreator:(VcCreatorBlock)vcCreator;

@end

NS_ASSUME_NONNULL_END
