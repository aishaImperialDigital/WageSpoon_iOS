//
//  VoomDatePickerView.m
//  Voom
//
//  Created by gqgnju on 20/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "VoomListPickerView.h"

@implementation VoomListPickerView

-(void) awakeFromNib
{
    [super awakeFromNib];
    
}

-(IBAction)pickerDone:(id)sender
{
    self.hidden = YES;
   // NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
   // [formatter setDateFormat:@"dd/MM"];
   // NSString *dateStri=[formatter stringFromDate:self.datePicker.date];
   // [self.dateTextfield setText:[NSString stringWithFormat:@"%@",dateStri]];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self endEditing:YES];
    self.hidden = NO;
    return NO;  // Hide both keyboard and blinking cursor.
}

@end
