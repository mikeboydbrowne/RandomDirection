//
//  ViewController.m
//  RandomDirection
//
//  Created by Michael Browne on 2/19/16.
//  Copyright © 2016 Michael Browne. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@end

@implementation ViewController

int NumReps = 0;
int TimeBetween = 0;

-(IBAction)DirectionButton:(id)sender {
    
    // getting values from UIPicker
    
    
    //
    for (int i = 0; i <= NumReps; i++) {
        RandomValue = arc4random() % 2;
        int SleepLength = (arc4random() % 1001) / 1000;
        [NSThread sleepForTimeInterval:TimeBetween];
        
        // display and say left
        if (RandomValue == 0) {
            [NSThread sleepForTimeInterval:SleepLength];
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Left"];
            AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
            [syn speakUtterance:utterance];
            DisplayRandomDirection.text = [NSString stringWithFormat:@"Left"];
            
            // display and say right
        } else {
            [NSThread sleepForTimeInterval:SleepLength];
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"Right"];
            AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
            [syn speakUtterance:utterance];
            DisplayRandomDirection.text = [NSString stringWithFormat:@"Right"];
        }
    }
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if([pickerView isEqual: _StartTimePicker]){
        return 11;
    }
    if([pickerView isEqual: _RepetitionsPicker]){
        return 20;
    }
    
    return 1;
}

// setting picker array
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if([pickerView isEqual: _StartTimePicker]){
        return [self.TimeArray objectAtIndex:row];
    }
    if([pickerView isEqual: _RepetitionsPicker]){
        return [self.RepetitionsArray objectAtIndex:row];
    }
    return [self.TimeArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if([pickerView isEqual: _StartTimePicker]){
        NSLog(@"You're going to wait %li seconds between reps", (long)row);
        TimeBetween = (int)row;
        
    }
    if([pickerView isEqual: _RepetitionsPicker]){
        NSLog(@"You're going to be doing %li reps", (long)row);
        NumReps = (int)row;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.TimeArray  = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10" ,nil];
    
    self.RepetitionsArray = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", nil];
    
    // style direction button
    DirectionButton.layer.cornerRadius = 10; // this value vary as per your desire
    DirectionButton.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
