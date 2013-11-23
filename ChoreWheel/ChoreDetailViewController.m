//
//  ChoreItemViewController.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/17/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "ChoreDetailViewController.h"

@interface ChoreDetailViewController ()

@end

@implementation ChoreDetailViewController

- (void)setChoreName:(NSString *)choreName
{
    _choreName = choreName;
    self.title = self.choreName;
}

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
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.title = @"Back";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
