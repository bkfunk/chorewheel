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

- (NSMutableArray *)choreSets
{
    if (!_choreSets) {
        _choreSets = [[NSMutableArray alloc]
                      initWithArray:@[@[@"Dishwasher",@"Dish Rack"],
                       @[@"Take out trash",@"Collect Trash"],
                       @[@"Towels",@"Trash Bins",@"Mailman"]]];
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
    NSObject *o = [self.choreSets firstObject]; // get from beginning
    [self.choreSets removeObjectAtIndex:0];
    [self.choreSets addObject:o]; // add to end
}
- (void)unrotateChores
{
    NSObject *o = [self.choreSets lastObject]; // get from end
    [self.choreSets removeLastObject];
    [self.choreSets insertObject:o atIndex:0]; // add to beginning
}
- (void)rotateChoresNTimes:(NSInteger)times
{
    if (times < 0) {
        for (NSInteger i=0; i<abs(times); i++) {
            [self unrotateChores];
        }
    } else {
        for (NSInteger i=0; i<times; i++) {
            [self rotateChores];
        }
    }
    NSLog(@"Chores: \n%@", self.choreSets);
}

@end
