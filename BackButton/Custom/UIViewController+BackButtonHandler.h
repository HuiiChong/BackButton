//
//  UIViewController+BackButtonHandler.h
//  DoSmile
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 庄 春辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>

@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (BackButtonHandler)<BackButtonHandlerProtocol>

@end
