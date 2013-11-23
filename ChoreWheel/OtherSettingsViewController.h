//
//  SettingsViewController.h
//  ChoreWheel
//
//  Created by Brian Karfunkel on 11/13/13.
//  Copyright (c) 2013 Brian Karfunkel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherSettingsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *dayPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;

@end
