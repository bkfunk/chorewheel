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
//@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSDate *displayDate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ChoreWheelViewController

- (IBAction)nextWeek:(UIButton *)sender {
    NSLog(@"Next week!");
    //[self.choreWheelModel rotateChores];
    [self rotateChoreWheelNTimes:1];
}
- (IBAction)prevWeek:(UIButton *)sender {
    NSLog(@"Prev week!");
    //[self.choreWheelModel unrotateChores];
    [self rotateChoreWheelNTimes:-1];
}
- (void)rotateChoreWheelNTimes:(NSInteger)times {
    
    //[self.choreWheelModel rotateChoresNTimes:times];
    NSDate *newDate = [self.displayDate dateByAddingTimeInterval:(7.0*24*60*60*times)];
    self.displayDate = newDate;
    [self.tableView reloadData];
    [self updateWeekLabel];
    //NSLog(@"New date: %@", newDate);
    
    //[self updateWeekLabelForDate:newDate];
}

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


- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        [_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    }
    return _dateFormatter;
}
- (NSDate *)displayDate
{
    if (!_displayDate) {
        //_displayDate = [NSDate date];
        [self setDisplayDate:[NSDate date]];
    }
    return _displayDate;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [self.choreWheelModel.choreSets[indexPath.section] objectAtIndex:indexPath.row];
    //cell.textLabel.text = [[self.choreWheelModel choreSetsForDate:self.displayDate][indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (void)updateWeekLabelForDate:(NSDate *)date
{
    self.displayDate = date;
    [self updateWeekLabel];
    
}
- (void)updateWeekLabel
{
    //self.weekLabel.text = [self.dateFormatter stringFromDate:self.displayDate];
    self.navigationController.title = [self.dateFormatter stringFromDate:self.displayDate];
    NSLog(@"Nav controller: %@", self.navigationController);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self updateWeekLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
