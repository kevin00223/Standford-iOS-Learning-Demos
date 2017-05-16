//
//  AttributorVC.m
//  AttributorDemo
//
//  Created by likai on 2017/5/11.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "AttributorVC.h"

@interface AttributorVC ()
@property (weak, nonatomic) IBOutlet UILabel *headTitle;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineBtn;

@end

@implementation AttributorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //将当前按钮标题的颜色 设置成标题的轮廓颜色
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:self.outlineBtn.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName: @3, NSStrokeColorAttributeName: self.outlineBtn.tintColor} range:NSMakeRange(0, [title length])];
    [self.outlineBtn setAttributedTitle:title forState:UIControlStateNormal];
}

//注册通知
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //监听字体大小变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
}

//注意加参数!!!!!
- (void)preferredFontChanged: (NSNotificationCenter *)notification
{
    [self usePreferredFonts];
}

- (void)usePreferredFonts
{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headTitle.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
}

//移除监听者
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //只移除对[UIContentSizeCategoryDidChangeNotification]的监听
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (IBAction)changeBodySelectionColorToMatchButtonBackgroundColor:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}

- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName: @-3, NSStrokeColorAttributeName: [UIColor yellowColor]} range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
