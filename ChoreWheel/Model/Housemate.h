//
//  Housemate.h
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/9/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChoreSet.h"
@interface Housemate : NSObject

- (instancetype)initWithName:(NSString *)name choreIndex:(NSUInteger)index;

@property (strong, nonatomic) ChoreSet *choreSet;
@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSUInteger choreIndex;

@end
