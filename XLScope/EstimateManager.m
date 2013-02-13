//
//  EstimateManager.m
//  XLScope
//
//  Created by Jason Liang on 2013-02-12.
//  Copyright (c) 2013 Xtreme Labs Inc. All rights reserved.
//

#import "EstimateManager.h"

static EstimateManager *instance;

@implementation EstimateManager

+ (EstimateManager *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[EstimateManager alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        [self initDefaultNumbers];
        
    }
    return self;
}

- (void)initDefaultNumbers {
    self.numbers = [[NSMutableArray alloc] initWithArray:@[@0, @0.5,@1,@1.5,@2,@2.5,@3,@4,@5,@6,@7,@8,@9,@10,@15,@20]];
    self.selectedNumbers = [[NSMutableDictionary alloc] initWithCapacity:3];
}


- (void)selectNumber:(NSNumber *)number {
    if ([self.selectedNumbers count] >= 3) {
        return;
    }
    [self.selectedNumbers setObject:@YES forKey:number];
}

- (void)deselectNumber:(NSNumber *)number {
    [self.selectedNumbers removeObjectForKey:number];
}

@end
