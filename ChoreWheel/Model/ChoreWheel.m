//
//  ChoreWheel.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/10/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "ChoreWheel.h"
@interface ChoreWheel ()

@end

@implementation ChoreWheel
@synthesize date = _date;

- (instancetype)init
{
    self = [super init];
    
    return self;
}
- (NSMutableArray *)rotatedChores
{
    if (!_rotatedChores) _rotatedChores = self.choreSets;
    return _rotatedChores;
}
- (NSDate *)rotationStartDate
{
    if (!_rotationStartDate) {
        _rotationStartDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"rotationStartDate"];
    }
    return _rotationStartDate;
}
- (NSMutableArray *)choreSets
{
    if (!_choreSets) {
        /*_choreSets = [[NSMutableArray alloc]
                      initWithArray:@[@[@"Dishwasher",@"Dish Rack"],
                       @[@"Take out trash",@"Collect Trash"],
                       @[@"Towels",@"Trash Bins",@"Mailman"]]];*/
        _choreSets = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"choreSets"]];
    }
    
    return _choreSets;
}
- (NSDate *)date
{
    if (!_date) _date = [NSDate date];
    return _date;
}
/*
- (void)setDate:(NSDate *)date
{
    _date = date;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit
                                                                   fromDate:self.rotationStartDate
                                                                     toDate:_date
                                                                    options:0];
    NSLog(@"Components: %@", components);
    self.rotatedChores = self.choreSets;
    [self rotateChoresNTimes:components.week];
}*/

- (NSMutableArray *)choreSetsForDate:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekCalendarUnit
                                                                   fromDate:self.rotationStartDate
                                                                     toDate:date
                                                                    options:0];
    NSLog(@"Components: %@", components);
    // get number of weeks since reference date
    // rotate original chore wheel N times?
    NSMutableArray *rotatedChores = [self choreSetsRotatedNTimes:components.week];
    //[self rotateChoresNTimes:components.week];
    
    //return [self chores:self.choreSets rotatedNTimes:components.week];
    return rotatedChores;
}

- (NSArray *)housemates
{
    if (!_housemates) _housemates = [[NSUserDefaults standardUserDefaults] objectForKey:@"housemates"];
        //@[@"Brian", @"Dave", @"John"];
    return _housemates;
}
/*
- (NSMutableArray *)rotateChores
{
    NSObject *o = [self.rotatedChores firstObject]; // get from beginning
    [self.rotatedChores removeObjectAtIndex:0];
    [self.rotatedChores addObject:o]; // add to end
    return self.rotatedChores;
}
- (NSMutableArray *)unrotateChores
{
    NSObject *o = [self.rotatedChores lastObject]; // get from end
    [self.rotatedChores removeLastObject];
    [self.rotatedChores insertObject:o atIndex:0]; // add to beginning
    return self.rotatedChores;
}*/
- (NSMutableArray *)choreSetsRotatedNTimes:(NSInteger)times
{
    NSMutableArray *rotatedChoreSets = self.choreSets;
    int rotations = (int)times % [rotatedChoreSets count];
    NSLog(@"Chore Sets: \n%@", rotatedChoreSets);
    NSLog(@"Rotating %ld times = %d rotations", times, rotations);
    
    
    if (rotations < 0) {
        for (int i = 0; i < abs(rotations); i++) {
            NSLog(@"Unrotating chores");
            //Unrotate chores
            NSObject *o = [rotatedChoreSets lastObject];
            [rotatedChoreSets removeLastObject];
            [rotatedChoreSets insertObject:o atIndex:0];
            NSLog(@"Chore Sets: \n%@", rotatedChoreSets);
            
        }
    } else {
        for (int i = 0; i < rotations; i++) {
            NSLog(@"Rotating Chores");
            
            NSObject *o = [rotatedChoreSets firstObject];
            [rotatedChoreSets removeObjectAtIndex:0];
            [rotatedChoreSets addObject:o];
            NSLog(@"Chore Sets: \n%@", rotatedChoreSets);
            
            
        }
    }
    NSLog(@"Final chore Sets: \n%@", rotatedChoreSets);
    
    return rotatedChoreSets;
}
/*
- (NSMutableArray *)chores:(NSMutableArray *)chores rotatedNTimes:(NSInteger)times
{
    self.rotatedChores = chores;
    
    //NSMutableArray *choresRotated = chores.copy;
    NSLog(@"Chores Before: %@", self.rotatedChores);
    // TODO: Get modulo of number of items, to remove full rotations
    int rotations = (int)times % [choresRotated count];
    
    if (rotations < 0) {
        for (int i = 0; i < abs(rotations); i++) {
            [self unrotateChores:choresRotated];
        }
    } else {
        for (int i = 0; i < rotations; i++) {
            [self rotateChores:choresRotated];
        }
    }
    NSLog(@"Chores After: %@", self.rotatedChores);
    return choresRotated;
}*/
/*
- (void)rotateChoresNTimes:(NSInteger)times
{
    int rotations = (int)times % [self.rotatedChores count];
    NSLog(@"Rotating %ld times = %d rotations", times, rotations);
    if (rotations < 0) {
        for (int i = 0; i < abs(rotations); i++) {
            NSLog(@"Unrotating chores");
            [self unrotateChores];
        }
    } else {
        for (int i = 0; i < rotations; i++) {
            [self rotateChores];
            NSLog(@"Rotating Chores");
        }
    }
}*/

@end
