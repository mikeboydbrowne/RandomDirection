//
//  ViewController.h
//  RandomDirection
//
//  Created by Michael Browne on 2/19/16.
//  Copyright © 2016 Michael Browne. All rights reserved.
//

#import <UIKit/UIKit.h>

int RandomValue;

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

{
    IBOutlet UILabel *DisplayRandomDirection;
    IBOutlet UIButton *DirectionButton;
}

// start time picker
@property (strong, nonatomic) IBOutlet  UIPickerView *StartTimePicker;
@property (strong, nonatomic)           NSArray *TimeArray;

// repetitions picker
@property (strong, nonatomic) IBOutlet  UIPickerView *RepetitionsPicker;
@property (strong, nonatomic)           NSArray *RepetitionsArray;

// button to start exercises
-(IBAction)DirectionButton:(id)sender;

@end

