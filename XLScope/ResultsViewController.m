//
//  ResultsViewController.m
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import "ResultsViewController.h"
#import "Utility.h"
#import "EstimateManager.h"
#import <QuartzCore/QuartzCore.h>

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.labelO.layer.cornerRadius = 10;
    self.labelN.layer.cornerRadius = 10;
    self.labelP.layer.cornerRadius = 10;
    
    [self.view addSubview:self.coverView];
    self.coverView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    EstimateManager *mgr = [EstimateManager sharedInstance];
    self.labelO.text = [NSString stringWithFormat:@"Optimistic : %@", mgr.numberO];
    self.labelN.text = [NSString stringWithFormat:@"Nominal : %@", mgr.numberN];
    self.labelP.text = [NSString stringWithFormat:@"Pessimistic : %@", mgr.numberP];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLabelO:nil];
    [self setLabelN:nil];
    [self setLabelP:nil];
    [super viewDidUnload];
}
- (IBAction)coverTapped:(id)sender {
    [UIView animateWithDuration:0.25f animations:^{
        self.coverView.alpha = 0;
    } completion:^(BOOL finished) {
        self.coverView.hidden = YES;
    }];
}

- (IBAction)dismissTapped:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    [[[EstimateManager sharedInstance] selectedNumbers] removeAllObjects];
}
@end
