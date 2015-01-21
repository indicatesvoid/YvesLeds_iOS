//
//  AllOnViewController.m
//  YvesLeds
//
//  Created by William Clark on 1/13/15.
//  Copyright (c) 2015 William Clark. All rights reserved.
//

#import "AllOnViewController.h"
#import "TabViewController.h"

@interface AllOnViewController ()

@end

@implementation AllOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // init RSColorPicker //
    _colorPicker = [[RSColorPickerView alloc] initWithFrame:CGRectMake(0, 0, _colorPickerFrame.frame.size.width, _colorPickerFrame.frame.size.height)];
    [_colorPicker setDelegate:self];
    [_colorPicker setCropToCircle:YES];
    _colorPickerFrame.backgroundColor = [UIColor clearColor];
    [_colorPickerFrame addSubview:_colorPicker];
}

- (void) viewDidAppear:(BOOL)animated {
    // send set mode message //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
