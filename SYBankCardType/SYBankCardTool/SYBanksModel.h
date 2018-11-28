//
//  SYBanksModel.h
//  SYBankCardType
//
//  Created by FaceBook on 2018/11/28.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYBanksModel : NSObject

/**
 * 银行卡卡号 例：622110
 */
@property(nonatomic,copy)NSString *bin;

/**
 * 银行名称 例：工商银行
 */
@property(nonatomic,copy)NSString *name;

/**
 * 银行类型 例：准贷记卡
 */
@property(nonatomic,copy)NSString *type;

@end

NS_ASSUME_NONNULL_END
