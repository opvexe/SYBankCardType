//
//  SYBankCardManger.m
//  SYBankCardType
//
//  Created by FaceBook on 2018/11/28.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "SYBankCardManger.h"
#import "SYBanksModel.h"
#import <MJExtension.h>
@implementation SYBankCardManger
{
    NSMutableArray *_lists;
}

+(SYBankCardManger *)shareInstance{
    static SYBankCardManger *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SYBanks" ofType:@"plist"];
        NSMutableArray *setting = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        _lists =  [SYBanksModel mj_objectArrayWithKeyValuesArray:setting];
    }
    return self;
}

-(NSArray *)searchWithInputString:(NSString *)inputString withFieldArray:(NSArray *)fieldArray{
        if (![_lists count] || ![fieldArray count]) {
            return nil;
        }
    
        NSPredicate *scopePredicate;
        NSMutableArray *backArray = [NSMutableArray array];
    
        for (NSString *fieldString in fieldArray) {
            NSArray *tempArray = [NSArray array];
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.%@ contains[c] %@", fieldString, inputString];
            tempArray = [_lists filteredArrayUsingPredicate:scopePredicate];
            for (NSObject *object in tempArray) {
                if (![backArray containsObject:object]) {
                    [backArray addObject:object];
                }
            }
        }
    
        return backArray;
}

@end
