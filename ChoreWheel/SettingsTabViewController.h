//
//  SettingsTabViewController.h
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/17/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoreWheel.h"

@interface SettingsTabViewController : UITabBarController
@property (nonatomic, strong) ChoreWheel *choreWheelModel;
@property (nonatomic, assign) id delegate;
@end
