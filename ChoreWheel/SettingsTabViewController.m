//
//  SettingsTabViewController.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/17/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "SettingsTabViewController.h"

@interface SettingsTabViewController ()
- (IBAction)closeSettings:(UIBarButtonItem *)sender;

@end

@implementation SettingsTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeSettings:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
