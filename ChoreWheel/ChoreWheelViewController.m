//
//  ChoreWheelViewController.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/9/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "ChoreWheelViewController.h"
#import "ChoreWheel.h"

@interface ChoreWheelViewController ()
@property (nonatomic, strong) ChoreWheel *choreWheelModel;
@end

@implementation ChoreWheelViewController

- (ChoreWheel *)choreWheelModel
{
    if (!_choreWheelModel) _choreWheelModel = [[ChoreWheel alloc] init];
    return _choreWheelModel;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.choreWheelModel.choreSets count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.choreWheelModel.choreSets[section] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.choreWheelModel.housemates objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [self.choreWheelModel.choreSets[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
