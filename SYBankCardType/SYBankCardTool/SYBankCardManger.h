//
//  SYBankCardManger.h
//  SYBankCardType
//
//  Created by FaceBook on 2018/11/28.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYBankCardManger : NSObject

/**
 * 单利
 
 @return 返回单利类
 */
+(SYBankCardManger *)shareInstance;


/**
 * 获取银行卡 信息

 @param fieldArray 搜索类型 @["bin",@"name"]
 @param inputString 输入文本
 @return 银行卡信息
 */
-(NSArray *)searchWithInputString:(NSString *)inputString withFieldArray:(NSArray *)fieldArray;



@end

NS_ASSUME_NONNULL_END
