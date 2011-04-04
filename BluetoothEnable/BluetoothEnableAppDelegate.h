//
//  BluetoothEnableAppDelegate.h
//  BluetoothEnable
//
//  Created by Jeff McLeman on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BluetoothEnableViewController;

@interface BluetoothEnableAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BluetoothEnableViewController *viewController;

@end
