//
//  MainViewController.m
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import "CenterViewController.h"
#import "EstimateManager.h"
#import "Cell.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initCollectionView];
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)initCollectionView {

    PSUICollectionViewFlowLayout *collectionViewFlowLayout = [[PSUICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [collectionViewFlowLayout setItemSize:CGSizeMake(100, 100)];
    [collectionViewFlowLayout setHeaderReferenceSize:CGSizeMake(320, 0)];
    [collectionViewFlowLayout setFooterReferenceSize:CGSizeMake(320, 0)];
    [collectionViewFlowLayout setMinimumInteritemSpacing:5];
    [collectionViewFlowLayout setMinimumLineSpacing:5];
    
    self.collectionView = [[PSUICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:collectionViewFlowLayout];
//    self.collectionView.dataSource = self;
//    self.collectionView.delegate = self;
    [self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor yellowColor];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Data Source & Delegate

- (NSInteger)collectionView:(PSTCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[EstimateManager sharedInstance] numbers] count];
}

- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    EstimateManager *mgr = [EstimateManager sharedInstance];
    NSNumber *number = [[mgr numbers] objectAtIndex:indexPath.row];
    cell.label.text = [NSString stringWithFormat:@"%@", number];
    BOOL isSelected = [mgr isNumberSelected:number];
    cell.backgroundColor = isSelected ? [UIColor lightGrayColor] : [UIColor whiteColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    EstimateManager *mgr = [EstimateManager sharedInstance];
    NSNumber *number = [[mgr numbers] objectAtIndex:indexPath.row];
    NSNumber *selected = [[mgr selectedNumbers] objectForKey:number];
    if (selected) {
        [mgr deselectNumber:number];
        [collectionView reloadData];
        return;
    } else {
        
        if ([[mgr selectedNumbers] count] >= 3) {
            NSArray *numbers = [[[mgr selectedNumbers] allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
                return [obj1 compare:obj2];
            }];
            if ([selected floatValue] < [[numbers objectAtIndex:0] floatValue]) {
                [mgr deselectNumber:[numbers objectAtIndex:0]];
            } else if ([selected floatValue] > [[numbers objectAtIndex:2] floatValue]) {
                [mgr deselectNumber:[numbers objectAtIndex:2]];
            } else {
                [mgr deselectNumber:[numbers objectAtIndex:1]];
            }
        }
        
        [mgr selectNumber:number];
        [collectionView reloadData];
    }
}

#pragma mark - PSTCollectionViewDelegateFlowLayout
//
//- (CGSize)collectionView:(PSUICollectionView *)collectionView layout:(PSUICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(150, 185);
//}
//
//- (CGFloat)collectionView:(PSUICollectionView *)collectionView layout:(PSUICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}
//
//- (CGFloat)collectionView:(PSUICollectionView *)collectionView layout:(PSUICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 0;
//}

@end
