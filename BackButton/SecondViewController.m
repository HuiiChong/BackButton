//
//  SecondViewController.m
//  BackButton
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 庄 春辉. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+BackButtonHandler.h"

@interface SecondViewController ()<UIAlertViewDelegate>

@property (nonatomic, copy) NSString *back;

@end

@implementation SecondViewController

#pragma mark life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"第二页";
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self addObserver:self forKeyPath:@"back" options:NSKeyValueObservingOptionOld
     |NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.back = @"no";
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self removeObserver:self forKeyPath:@"back"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)navigationShouldPopOnBackButton
{
    if([self.back isEqualToString:@"no"]){
        UIAlertView *_alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"确认要返回吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [_alert show];
        return NO;
    }else{
        return YES;
    }
}

#pragma mark kvo

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"back"]){
        NSString *_new = [change objectForKey:@"new"];
        if([_new isEqualToString:@"no"]){
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }else{
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
}

#pragma mark alert delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1){
        self.back = @"yes";
        [self.navigationController popViewControllerAnimated:YES];
    }else if(buttonIndex==0){
        self.back = @"no";
    }
}

@end
