//
//  ChoreWheel.h
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/10/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChoreWheel : NSObject

- (instancetype)init;

//- (void)rotateChores;
//- (void)rotateChoresNTimes:(NSInteger)times;
//- (void)unrotateChores;
- (NSArray *)choreSetsForDate:(NSDate *)date;


@property (strong, nonatomic) NSMutableArray *choreSets; // of Chore Set
@property (strong, nonatomic) NSArray *housemates;
@property (strong, nonatomic) NSDate *rotationStartDate;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSMutableArray *rotatedChores;

@end
