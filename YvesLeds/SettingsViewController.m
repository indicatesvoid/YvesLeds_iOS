//
//  SettingsViewController.m
//  YvesLeds
//
//  Created by William Clark on 1/14/15.
//  Copyright (c) 2015 William Clark. All rights reserved.
//

#import "SettingsViewController.h"
#import "TabViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _statusLabel.text = @"DISCONNECTED";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    // set delegate for LeDiscovery and start scan //
    [[LeDiscovery sharedInstance] setDiscoveryDelegate:self];
    
    // start scan when view appears //
    if( [[LeDiscovery sharedInstance] startScanningForUUIDString:nil] == CBCentralManagerStatePoweredOff)
    {
        //        [indicator stopAnimating];
    }else{
        //        [indicator startAnimating];
        
        devices = [[LeDiscovery sharedInstance] foundPeripherals];
        
        // are we already connected to something? //
        if([[[LeDiscovery sharedInstance] connectedPeripherals] count]!= 0) {
            _statusLabel.text = @"CONNECTED";
        } else {
            // automatically connect to first available peripheral //
            if(devices.count > 0) {
                CBPeripheral* p = [devices objectAtIndex:0];
                [[LeDiscovery sharedInstance] connectPeripheral:p];
            }
        }
        
        [_connectionPicker reloadAllComponents];
    }
}

- (void) viewWillDisappear:(BOOL)animated {
    // set delegate for LeDiscovery back to TabViewController
    [[LeDiscovery sharedInstance] setDiscoveryDelegate:(TabViewController*)self.tabBarController];
}

#pragma mark - UIPickerViewDataSource
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
//    return [devices count];
return 0;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 1;
}

#pragma mark - UIPickerViewDelegate
- (NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    CBPeripheral* p = [devices objectAtIndex:row];
    return p.name;
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // connect //
    [[LeDiscovery sharedInstance] connectPeripheral:[devices objectAtIndex:row]];
}

#pragma mark - LeDiscoveryDelegate
- (void) discoveryDidRefresh {
}

- (void) discoveryStateChanged:(CBCentralManagerState)state {
}

- (void) peripheralDidConnect:(CBPeripheral *)peripheral {
    TabViewController* tvc = (TabViewController*)self.tabBarController;
    tvc.currentPeripheral = peripheral;
    _statusLabel.text = @"CONNECTED";
}

- (void) peripheralDidDisconnect:(CBPeripheral *)peripheral {
_statusLabel.text = @"DISCONNECTED";
}

@end
