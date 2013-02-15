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
    self.numbers = [[NSMutableArray alloc] initWithArray:@[@0, @0.5,@1,@1.5,@2,@2.5,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@100]];
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

- (BOOL)isNumberSelected:(NSNumber*)number {
    return [self.selectedNumbers objectForKey:number] != nil;
}

- (void)completeNumbers {
    NSArray *numbers = [[[self selectedNumbers] allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    if ([numbers count] == 0) {
        self.numberN = self.numberO = self.numberP = @0;
    } else if ([numbers count] == 1) {
        self.numberN = self.numberO = self.numberP = [numbers objectAtIndex:0];
    } else if ([numbers count] == 2) {
        self.numberN = self.numberO = [numbers objectAtIndex:0];
        self.numberP = [numbers objectAtIndex:1];
    } else if ([numbers count] == 3) {
        self.numberO = [numbers objectAtIndex:0];
        self.numberN = [numbers objectAtIndex:1];
        self.numberP = [numbers objectAtIndex:2];
    }
}

@end
