//
//  ViewController.m
//  SYBankCardType
//
//  Created by FaceBook on 2018/11/28.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ViewController.h"
#import "SYBankCardManger.h"
#import "SYBanksModel.h"
@interface ViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UILabel *showLabel;
@property(nonatomic,strong)UITextField *showField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _showLabel = ({
        UILabel *iv = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 80.0f)];
        [self.view addSubview:iv];
        iv.textAlignment = NSTextAlignmentCenter;
        iv.textColor = [UIColor greenColor];
        iv.numberOfLines = 0;
        iv;
    });
    
    _showField = ({
        UITextField *iv = [[UITextField alloc] initWithFrame:CGRectMake(50, 300.0f, 300, 50)];
        [self.view addSubview:iv];
        iv.leftViewMode = UITextFieldViewModeAlways;
        iv.keyboardType =  UIKeyboardTypeDecimalPad;
        iv.delegate = self;
        iv.backgroundColor = [UIColor orangeColor];
        iv;
    });
}

#pragma mark  UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *text = [self.showField text];
    
    //返回一个字符集,指定字符串中包含的字符
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //不能写nil
    NSString *newString = @"";
    while (text.length > 0) {
        //每4位截取/不够4位有多少截取多少
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        newString = [newString stringByAppendingString:subString];
        //加空格
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    //限制长度
    if (newString.length >= 24) {
        return NO;
    }
    
    [self.showField setText:newString];
    NSString *originalStr = [newString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //获取银行信息
    NSArray *souce = [[SYBankCardManger shareInstance]searchWithInputString:originalStr withFieldArray:@[@"bin"]];
    if (souce.count) {
        SYBanksModel *model = souce.firstObject;
        self.showLabel.text = [NSString stringWithFormat:@"%@--%@--%@",model.bin,model.name,model.type];
    }
    
    return NO;
}


@end
