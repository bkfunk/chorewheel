//
//  ChoreWheelAppDelegate.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/9/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "ChoreWheelAppDelegate.h"

@implementation ChoreWheelAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[FBLoginView class];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *loadDefaults = [[NSMutableDictionary alloc] init];
    [loadDefaults setObject:[[NSMutableArray alloc]
                             initWithArray:@[@[@"1: Dishwasher",@"Drying Rack"],
                                             @[@"2: Clean Out Fridge",@"Wash Towels",@"Collect Dishes",@"Roll Out Trash Bins"],
                                             @[@"Collect Trash",@"Take Out Trash",@"Mailman"]]]
                     forKey:@"choreSets"];
    [loadDefaults setObject:@[@{ @"name" : @"Brian",
                                 @"listingIndex" : @0,
                                 @"choreIndex" : @0 },
                              @{ @"name" : @"Dave" ,
                                 @"listingIndex" : @1,
                                 @"choreIndex" : @1 },
                              @{ @"name" : @"John",
                                 @"listingIndex" : @2,
                                 @"choreIndex" : @2 }]
                     forKey:@"housemates"];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *rotationStartDateComponents = [[NSDateComponents alloc] init]; // Date when first rotation starts
    [rotationStartDateComponents setYear:2013];
    [rotationStartDateComponents setMonth:10];
    [rotationStartDateComponents setDay:9];
    [rotationStartDateComponents setHour:9];
    NSDate *rotationStartDate = [calendar dateFromComponents:rotationStartDateComponents];
    [loadDefaults setObject:rotationStartDate forKey:@"rotationStartDate"];
    
    
    /*
    NSDateComponents *rotationDateComponents = [[NSDateComponents alloc] init];
    [rotationDateComponents setHour:0];
    [rotationDateComponents setMinute:0];
    //[rotationDateComponents setTimeZone:[NSTimeZone defaultTimeZone]];
    [rotationDateComponents setYear:2013];
    NSDate *rotationDate = [calendar dateFromComponents:rotationDateComponents];
    NSLog(@"Rotation date: %@", rotationDate);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE MMM dd, yyyy - hh:mm:ss a, z"];
    NSLog(@"Formatted: %@", [formatter stringFromDate:rotationDate]);
    
    [loadDefaults setObject:rotationDate forKey:@"rotationStartDate"];
    
    NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:rotationDate];
    NSLog(@"Weekday: %@", weekdayComponents);
    [loadDefaults setObject:[NSNumber numberWithInteger:weekdayComponents.weekday] forKey:@"rotationWeekday"];
    
    NSDateComponents *dc = [calendar components:NSWeekCalendarUnit fromDate:rotationDate toDate:[NSDate date] options:0];
    NSLog(@"Components  weeks: %@", dc);
    
    NSDate *testDate = [calendar dateByAddingComponents:dc toDate:rotationDate options:0];
    NSLog(@"Adding to date: %@", [formatter stringFromDate:testDate]);
    
    NSInteger weeksFromRotationStartDate = dc.week;
    
    [loadDefaults setObject:[NSNumber numberWithInteger:weeksFromRotationStartDate] forKey:@"weeksFromRotationStartDate"];
    */
    [defaults registerDefaults:loadDefaults];
    [defaults synchronize];
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
