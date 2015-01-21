//
//  SettingsViewController.h
//  YvesLeds
//
//  Created by William Clark on 1/14/15.
//  Copyright (c) 2015 William Clark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSArray* devices;
}

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *connectionPicker;

@end
