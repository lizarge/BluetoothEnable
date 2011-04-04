//
//  BluetoothEnableViewController.h
//  BluetoothEnable
//
//  Created by Jeff McLeman on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BluetoothManager;

@interface BluetoothEnableViewController : UIViewController {
    
    IBOutlet UILabel  *programLabel;
    IBOutlet UIButton *enableButton;
    IBOutlet UILabel  *copyrightLabel;
    IBOutlet UILabel  *copyrightLabel2;
    IBOutlet UILabel  *statusLabel;
    id  bluetoothEnabled;
    id btCont;
}

@property (nonatomic, retain) UILabel  *programLabel;
@property (nonatomic, retain) UIButton *enableButton;
@property (nonatomic, retain) UILabel  *copyrightLabel;
@property (nonatomic, retain) UILabel  *copyrightLabel2;
@property (nonatomic, assign) id bluetoothEnabled;
@property (nonatomic, retain) id btCont;
@property (nonatomic, retain) UILabel  *statusLabel;
-(IBAction)handleButtonPress:(id)sender;
-(void)showBTStatus;

@end
