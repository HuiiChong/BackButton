//
//  ViewController.m
//  BackButton
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 庄 春辉. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *_rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(btnAddClicked:)];
    self.navigationItem.rightBarButtonItem = _rightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button event

- (void)btnAddClicked:(id)sender
{
    SecondViewController *_secondController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:_secondController animated:YES];
}

@end
