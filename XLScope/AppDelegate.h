//
//  AppDelegate.h
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UIViewController *leftController;
@property (strong, nonatomic) UIViewController *rightController;

@property (strong, nonatomic) UIWindow *overlayWindow;

@end
