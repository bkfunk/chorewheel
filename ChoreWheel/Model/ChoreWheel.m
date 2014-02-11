//
//  ChoreWheel.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/10/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "ChoreWheel.h"
@interface ChoreWheel ()

@property (strong, nonatomic) NSMutableArray *choreSets; // of NSArray
@property (strong, nonatomic) NSMutableArray *housemates; // of Housemate
@property (strong, nonatomic) NSDate *rotationStartDate;

@end

@implementation ChoreWheel

@synthesize date = _date;

- (instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark - Getters / Setters

- (NSArray *)housemates
{
    if (!_housemates) {
        _housemates = [[NSMutableArray alloc] init];
        NSArray *housematesArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"housemates"];
        for (NSDictionary *housemate in housematesArray) {
            // Build a new Housemate and add it to the array
            [_housemates addObject:[[Housemate alloc] initWithName:(NSString *)[housemate valueForKey:@"name"]
                                                           choreIndex:[(NSNumber *)[housemate valueForKey:@"choreIndex"] integerValue]]];
        }
    }
    return _housemates;
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
        //_choreSets = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"choreSets"]];
        //_choreSets = [[[NSUserDefaults standardUserDefaults] objectForKey:@"choreSets"] mutableCopy];
        NSArray *defaultChoreSets = [[NSUserDefaults standardUserDefaults] objectForKey:@"choreSets"];
        _choreSets = [[NSMutableArray alloc] initWithCapacity:[defaultChoreSets count]];
        for (NSArray *defaultChoreSet in defaultChoreSets) {
            [_choreSets addObject:[NSMutableArray arrayWithArray:defaultChoreSet]];
        }
        NSLog(@"Chore Sets class: %@ \ncontents: %@",[_choreSets class], _choreSets);
        for (id cs in _choreSets) {
            NSLog(@"chore set array class: %@ contents %@",[cs class], cs);
        }
    }
    return _choreSets;
}

- (NSDate *)date
{
    if (!_date) _date = self.rotationStartDate;
    return _date;
}
- (void)setDate:(NSDate *)newDate
{
    // Get difference, in weeks, between current date and date we are rotating to
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSDayCalendarUnit | NSHourCalendarUnit)
                                                                   fromDate:self.date
                                                                     toDate:newDate
                                                                    options:1];
    NSLog(@"From: %@ to %@ \n Components: %@", self.date, newDate, components);
    
    // For daylight savings time, some weeks are either 7 days 1 hour or 6 days 23 hours.
    NSInteger days = components.day + round(components.hour / 24.0);
    NSInteger rotations = days / 7;
    // Rotate that many times
    [self rotateChoresNTimes:round(rotations)];
    // Set date
    _date = newDate;
}


- (NSString *)titleForChoreGroup:(NSInteger)group
{
    return [[self housemateAtIndex:group] name];
    
}
- (NSUInteger)choreGroupCount
{
    return [self.housemates count];
}
- (NSArray *)choresForChoreGroup:(NSInteger)group;
{
    NSInteger index = [[self housemateAtIndex:group] choreIndex];
    if (index < [self.choreSets count]) {
        return [self.choreSets objectAtIndex:index];
    } else {
        return nil;
    }
}

- (NSInteger)choreCountForChoreGroup:(NSInteger)group
{
    return [[self choresForChoreGroup:group] count];
}
- (NSString *)choreInChoreGroup:(NSInteger)group atIndex:(NSInteger)index
{
    return [[self choresForChoreGroup:group] objectAtIndex:index];
}

- (void)moveChoreFromGroup:(NSInteger)fromGroup fromIndex:(NSInteger)fromIndex toGroup:(NSInteger)toGroup toIndex:(NSInteger)toIndex
{
    NSLog(@"Chore sets: %@", self.choreSets);
    NSString *newChore = [[self.choreSets objectAtIndex:fromGroup]
                       objectAtIndex:fromIndex];
    [[self.choreSets objectAtIndex:fromGroup] removeObjectAtIndex:fromIndex];
    [[self.choreSets objectAtIndex:toGroup] insertObject:newChore
                                                 atIndex:toIndex];
    //NSMutableArray *newChoreGroup = [[self.choreSets objectAtIndex:toGroup] mutableCopy];
    //[newChoreGroup insertObject:newChore atIndex:toIndex];
    //[self.choreSets replaceObjectAtIndex:toGroup withObject:newChoreGroup];
    //[self.choreSets objectAtIndex:toGroup] =
    NSLog(@"New chores sets: %@", self.choreSets);
}



- (Housemate *)housemateAtIndex:(NSUInteger)index
{
    
    return [self.housemates objectAtIndex:index];
}

- (NSUInteger)housematesCount
{
    return [self.housemates count];
}

- (NSString *)housemateNameAtIndex:(NSInteger)index
{
    return [[self housemateAtIndex:index] name];
}


- (void)rotateChoresNTimes:(NSInteger)times
{
    NSInteger rotations = times % (NSInteger)[self.housemates count];
    if (rotations < 0) rotations += [self.housemates count];
    NSLog(@"Rotating %ld times = %ld rotations", times, rotations);
    for (Housemate *housemate in self.housemates) {
        housemate.choreIndex = (housemate.choreIndex + rotations) % [self.housemates count];
    }
}

@end
