//
//  ChoreWheel.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/10/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "ChoreWheel.h"

@implementation ChoreWheel

- (instancetype)init
{
    self = [super init];
    
    return self;
}

- (NSArray *)choreSets
{
    if (!_choreSets) {
        _choreSets = @[@[@"Dishwasher",@"Dish Rack"],
                       @[@"Take out trash",@"Collect Trash"],
                       @[@"Towels",@"Trash Bins",@"Mailman"]];
    }
    
    return _choreSets;
}

- (NSArray *)housemates
{
    if (!_housemates) _housemates = @[@"Brian", @"Dave", @"John"];
    return _housemates;
}

- (void)rotateChores
{
    
}
- (void)rotateChoresNTimes:(NSUInteger)times
{
    for (NSInteger i=0; i<times; i++) {
        [self rotateChores];
    }
}
@end
