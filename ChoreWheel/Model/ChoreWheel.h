//
//  ChoreWheel.h
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/10/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Housemate.h"

@interface ChoreWheel : NSObject

- (instancetype)init;


- (NSString *)titleForChoreGroup:(NSInteger)group;
- (NSArray *)choresForChoreGroup:(NSInteger)group;
//- (NSArray *)choreGroupTitles;
- (NSUInteger)choreGroupCount;
- (NSInteger)choreCountForChoreGroup:(NSInteger)group;
- (NSString *)choreInChoreGroup:(NSInteger)group atIndex:(NSInteger)index;

- (void)moveChoreFromGroup:(NSInteger)fromGroup fromIndex:(NSInteger)fromIndex toGroup:(NSInteger)toGroup toIndex:(NSInteger)toIndex;

- (NSUInteger)housematesCount;
- (NSString *)housemateNameAtIndex:(NSInteger)index;

//- (void)rotateChores;
//- (void)rotateChoresNTimes:(NSInteger)times;
//- (void)unrotateChores;
//- (NSArray *)choreSetsForDate:(NSDate *)date;


//@property (strong, nonatomic) NSMutableArray *choreSets; // of Chore Set
//@property (strong, nonatomic) NSArray *housemates;
//@property (strong, nonatomic) NSDate *rotationStartDate;
@property (strong, nonatomic) NSDate *date;
//@property (strong, nonatomic) NSMutableArray *rotatedChores;

@end
