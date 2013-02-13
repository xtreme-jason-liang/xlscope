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

- (void)selectNumber:(NSNumber*)number;
- (void)deselectNumber:(NSNumber*)number;

@end
