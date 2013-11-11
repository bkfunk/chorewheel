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

- (void)rotateChores;
- (void)rotateChoresNTimes:(NSInteger)times;
- (void)unrotateChores;


@property (strong, nonatomic) NSMutableArray *choreSets; // of Chore Set
@property (strong, nonatomic) NSArray *housemates;

@end
