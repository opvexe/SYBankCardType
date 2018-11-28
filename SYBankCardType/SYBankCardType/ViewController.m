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
@interface ViewController ()
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
        [iv addTarget:self action:@selector(textChangeAction:) forControlEvents:UIControlEventEditingChanged];
        iv.backgroundColor = [UIColor orangeColor];
        iv;
    });
}

-(void)textChangeAction:(UITextField *)tf{
    NSArray *souce = [[SYBankCardManger shareInstance]searchWithInputString:tf.text withFieldArray:@[@"bin"]];
    SYBanksModel *model = souce.firstObject;
    self.showLabel.text = [NSString stringWithFormat:@"%@--%@--%@",model.bin,model.name,model.type];
    NSLog(@"%@",souce);
}
@end
