//
//  Housemate.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/9/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "Housemate.h"

@implementation Housemate


- (instancetype)initWithName:(NSString *)name choreIndex:(NSUInteger)index
{
    self = [super init];
    
    self.name = name;
    self.choreIndex = index;
    
    return self;
}

@end
