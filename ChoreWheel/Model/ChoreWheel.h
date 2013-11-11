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
- (void)rotateChoresNTimes:(NSUInteger)times;

@property (strong, nonatomic) NSArray *choreSets; // of Chore Set
@property (strong, nonatomic) NSArray *housemates;

@end
