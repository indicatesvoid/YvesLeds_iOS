//
//  AllOnViewController.h
//  YvesLeds
//
//  Created by William Clark on 1/13/15.
//  Copyright (c) 2015 William Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSColorPickerView.h"

@interface AllOnViewController : UIViewController <RSColorPickerViewDelegate> {
}

@property (nonatomic) RSColorPickerView *colorPicker;
@property (weak, nonatomic) IBOutlet UIView *colorPickerFrame;

@end

