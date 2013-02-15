//
//  ResultsViewController.h
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UILabel *labelO;
@property (weak, nonatomic) IBOutlet UILabel *labelN;
@property (weak, nonatomic) IBOutlet UILabel *labelP;
- (IBAction)coverTapped:(id)sender;
- (IBAction)dismissTapped:(id)sender;

@end
