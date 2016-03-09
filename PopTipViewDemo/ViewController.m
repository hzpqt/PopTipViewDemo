//
//  ViewController.m
//  PopTipViewDemo
//
//  Created by pqt on 16/3/7.
//  Copyright © 2016年 pqt. All rights reserved.
//

#import "ViewController.h"
#import "PopTipView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
- (IBAction)deleteButtonClicked:(id)sender
{
    [PopTipView showInView:self.view wihtTipText:@"删除成功"];
}

- (IBAction)networkErrorButtonClicked:(id)sender
{
    [PopTipView showInView:self.view.window wihtNetWorkErrorTipText:@"网络异常\r\n请重新加载"];
}

@end
