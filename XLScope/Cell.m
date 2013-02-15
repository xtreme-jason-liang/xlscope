//
//  Cell.m
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import "Cell.h"
#import "CustomCellBackground.h"
#import <QuartzCore/QuartzCore.h>

@implementation Cell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CustomCellBackground *backgroundView = [[CustomCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;
        [self initLabel];
        self.layer.cornerRadius = 5;
    }
    return self;
}

- (void)initLabel {
    self.label = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont boldSystemFontOfSize:30.0f];
    [self addSubview:self.label];
    self.label.backgroundColor = [UIColor clearColor];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view
        CustomCellBackground *backgroundView = [[CustomCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;
    }
    return self;
}

- (void)setSelectedState:(BOOL)selected {
    if (selected) {
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor yellowColor].CGColor;
        self.backgroundColor = [UIColor colorWithRed:0 green:128.f/255.f blue:1 alpha:1];
        self.label.textColor = [UIColor whiteColor];
    } else {
        self.layer.borderWidth = 0;
        self.backgroundColor = [UIColor whiteColor];
        self.label.textColor = [UIColor blackColor];
    }
}


@end
