//
//  ChoreWheelTableViewController.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/17/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "ChoreWheelTableViewController.h"
#import "ChoreWheel.h"
#import "ChoreDetailViewController.h"
#import "SettingsTabViewController.h"

@interface ChoreWheelTableViewController ()
@property (nonatomic, strong) ChoreWheel *choreWheelModel;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSDate *displayDate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *todayButton;
//@property (strong, nonatomic) NSArray *choreSets;
@end

@implementation ChoreWheelTableViewController

#pragma mark - Getters
- (ChoreWheel *)choreWheelModel
{
    if (!_choreWheelModel) _choreWheelModel = [[ChoreWheel alloc] init];
    return _choreWheelModel;
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

@synthesize displayDate = _displayDate;
- (NSDate *)displayDate
{
    if (!_displayDate) {
        _displayDate = [NSDate date];
    }
    return _displayDate;
}
- (void)setDisplayDate:(NSDate *)displayDate
{
    _displayDate = displayDate;
    [self.choreWheelModel setDate:_displayDate];
    // Set chore sets array to be the chore sets from the model, for the current display date
    //[self setChoreSets:[self.choreWheelModel choreSetsForDate:_displayDate]];
    [self updateDateDisplayTitle];
    [self updateTodayButton];
    
    
}
/*
- (NSArray *)choreSets
{
    if (!_choreSets) _choreSets = [self.choreWheelModel choreSetsForDate:self.displayDate];
    return _choreSets;
}*/


#pragma mark - Buttons to Rotate Chores/Set Date

- (IBAction)setDateToToday:(UIBarButtonItem *)sender {
    
    [self setDisplayDate:[NSDate date]];
    //[self updateDateDisplayTitleForDate:[NSDate date]];
    //[self updateTodayButton];
    [self.tableView reloadData];
}

- (IBAction)prevWeek:(UIBarButtonItem *)sender
{
    [self rotateChoreWheelNTimes:-1];
}

- (IBAction)nextWeek:(UIBarButtonItem *)sender
{
    [self rotateChoreWheelNTimes:1];
}

 
- (void)rotateChoreWheelNTimes:(NSInteger)times
{
    
    [self setDisplayDate:[self.displayDate dateByAddingTimeInterval:(7.0*24*60*60*times)]];
    [self.tableView reloadData];
    
}

#pragma mark - Update Date Displays

- (void)updateDateDisplayTitle
{
    self.title = [self.dateFormatter stringFromDate:self.displayDate];
}

- (void)updateTodayButton
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM dd, yyyy"];
    
    if (![[formatter stringFromDate:self.displayDate] isEqualToString:[formatter stringFromDate:[NSDate date]]]) {
        // If looking ahead/back, set Today button to go back to current date
        self.todayButton.title = @"Today";
        self.todayButton.enabled = YES;
    } else { // disable button and hide title
        self.todayButton.title = @"";
        self.todayButton.enabled = NO;
    }
}

#pragma mark - VC Lifecycle

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self setDisplayDate:[NSDate date]];
    //[self updateDateDisplayTitle];
    NSLog(@"main view did load");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    //return [self.choreWheelModel.rotatedChores count];
    //return [self.choreSets count];
    
    return [self.choreWheelModel choreGroupCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //NSInteger choreCount = [[self.choreWheelModel choresForChoreGroup:section] count];
    NSInteger choreCount = [self.choreWheelModel choreCountForChoreGroup:section];
    return (choreCount > 0) ? choreCount : 1; // if empty, we'll create a cell for "None"
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.choreWheelModel titleForChoreGroup:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChoreCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set text to be the chore title
    //cell.textLabel.text = [[self.choreWheelModel choresForChoreGroup:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [self.choreWheelModel choreInChoreGroup:indexPath.section atIndex:indexPath.row];
    if (cell.textLabel.text == nil) {
        cell.textLabel.text = @"None";
        cell.textLabel.enabled = NO;
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.textLabel.enabled = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)viewDidAppear:(BOOL)animated
{
    
    NSLog(@"View Appear");
}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"View will appear");
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Destination class: %@", [segue.destinationViewController class]);
    
    // ShowChoreDetail
    if ([segue.identifier isEqualToString:@"ShowChoreDetail"]) {
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            UITableViewCell *choreCell = (UITableViewCell *)sender;
            if ([segue.destinationViewController isKindOfClass:[ChoreDetailViewController class]]) {
                ChoreDetailViewController *choreDetailVC = (ChoreDetailViewController *)segue.destinationViewController;
                choreDetailVC.choreName = choreCell.textLabel.text;
                self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
            }
        }
    } else if ([segue.identifier isEqualToString:@"ShowSettings"]) {
        if ([segue.destinationViewController isKindOfClass:[SettingsTabViewController class]]) {
            SettingsTabViewController *settingsTabVC = (SettingsTabViewController *)segue.destinationViewController;
            settingsTabVC.choreWheelModel = self.choreWheelModel;
            self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
            NSLog(@"Did prep for segue");
            settingsTabVC.delegate = self;
        }
    }
}


@end
