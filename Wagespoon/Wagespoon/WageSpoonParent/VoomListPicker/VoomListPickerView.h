//
//  VoomDatePickerView.h
//  Voom
//
//  Created by gqgnju on 20/06/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VoomListPickerView : UIView <UITextFieldDelegate>{
}

@property(nonatomic,strong) IBOutlet UIPickerView *datePicker;
@property(nonatomic,strong) UITextField *dateTextfield;
-(IBAction)pickerDone:(id)sender;
@end
