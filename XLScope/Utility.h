//
//  Utility.h
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppDelegate;

@interface Utility : NSObject

+ (UIWindow*)getAppDelegateOverlayWindow;
+ (void)dismissAppDelegateOverlayWindow;
+ (AppDelegate*)getAppDelegate;

@end
