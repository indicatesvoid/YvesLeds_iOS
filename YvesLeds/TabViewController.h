//
//  TabViewController.h
//  YvesLeds
//
//  Created by William Clark on 1/13/15.
//  Copyright (c) 2015 William Clark. All rights reserved.
//

#ifndef YvesLeds_TabViewController_h
#define YvesLeds_TabViewController_h

#import <UIKit/UIKit.h>
#import "BLE.h"

@interface TabViewController : UITabBarController <BLEDelegate>

@property (weak, nonatomic) CBPeripheral* currentPeripheral;

@end

#endif
