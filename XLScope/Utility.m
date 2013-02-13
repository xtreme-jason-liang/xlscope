//
//  Utility.m
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import "Utility.h"
#import "AppDelegate.h"

@implementation Utility

+ (AppDelegate*)getAppDelegate {
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    return delegate;
}

+ (UIWindow*)getAppDelegateOverlayWindow {
    AppDelegate *delegate = [Utility getAppDelegate];
    if (!delegate.overlayWindow) {
        delegate.overlayWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        delegate.overlayWindow.windowLevel = UIWindowLevelStatusBar+1;
        delegate.overlayWindow.hidden = NO;
        [delegate.overlayWindow makeKeyAndVisible];
    }
    return delegate.overlayWindow;
}


+ (void)dismissAppDelegateOverlayWindow {
    AppDelegate *delegate = [Utility getAppDelegate];
    if (delegate.overlayWindow) {
        [delegate.overlayWindow resignKeyWindow];
    }
    delegate.overlayWindow = nil;
}

@end
