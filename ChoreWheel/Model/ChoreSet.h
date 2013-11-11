//
//  ChoreSet.h
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/9/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChoreSet : NSMutableArray

@property (strong, nonatomic) NSString *shortName;
@property (strong, nonatomic) NSMutableArray *chores; // of Chore

- (void)addChores:(NSArray *)newChores;

@end
