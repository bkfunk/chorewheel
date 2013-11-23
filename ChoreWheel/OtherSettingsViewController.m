//
//  SettingsViewController.m
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/13/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import "OtherSettingsViewController.h"

@interface OtherSettingsViewController ()

//@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

//@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) NSArray *dayArray;
@property (strong, nonatomic) NSString *selectedDay;

@end

@implementation OtherSettingsViewController
- (IBAction)closeSettingsView:(UIButton *)sender {
    NSLog(@"Day selected: %@; Time Selected: %@", [self.dayArray objectAtIndex:[self.dayPicker selectedRowInComponent:0] % [self.dayArray count]], self.timePicker.date);
}

- (NSArray *)dayArray
{
    if (!_dayArray) {
        _dayArray = [[NSArray alloc] initWithObjects: @"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", nil];
    }
    return _dayArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static const int DAY_PICKER_ROTATIONS = 49;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.picker.delegate = self;
    //self.picker.dataSource = self;
    int startRow = 0;
    [self.dayPicker selectRow:startRow + (DAY_PICKER_ROTATIONS/2) * [self.dayArray count]
                  inComponent:0
                     animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UIPickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return DAY_PICKER_ROTATIONS * [self.dayArray count];
}

#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //NSLog(@"Row: %ld Modulo: %ld", row, (row % [self.dayArray count]));
    return [self.dayArray objectAtIndex:(row % [self.dayArray count])];
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (row < (-1 + DAY_PICKER_ROTATIONS/2) * [self.dayArray count] || row >= ((1+DAY_PICKER_ROTATIONS/2) * [self.dayArray count])) {
        row = row % [self.dayArray count];
        row += (DAY_PICKER_ROTATIONS / 2) * [self.dayArray count];
        [self.dayPicker selectRow:row inComponent:component animated:NO];
    }
    //Let's print in the console what the user had chosen;
    //NSLog(@"Chosen item: %@", [self.dayArray objectAtIndex:(row % [self.dayArray count])]);
    //self.selectedDay = [self.dayArray objectAtIndex:row];
}

@end
