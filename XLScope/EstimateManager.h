//
//  EstimateManager.h
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EstimateManager : NSObject

+ (EstimateManager*) sharedInstance;

@property (nonatomic, strong) NSMutableArray *numbers;
@property (nonatomic, strong) NSMutableDictionary *selectedNumbers;


@property (nonatomic, strong) NSNumber *numberO;
@property (nonatomic, strong) NSNumber *numberN;
@property (nonatomic, strong) NSNumber *numberP;

- (void)selectNumber:(NSNumber*)number;
- (void)deselectNumber:(NSNumber*)number;
- (BOOL)isNumberSelected:(NSNumber*)number;

- (void)completeNumbers;
@end
