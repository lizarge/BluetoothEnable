//
//  BluetoothEnableViewController.h
//  BluetoothEnable
//
//  Created by Jeff McLeman on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BluetoothManager, BluetoothDevice;

@interface BluetoothEnableViewController : UIViewController {
    
    IBOutlet UILabel  *programLabel;
    IBOutlet UIButton *enableButton;
    IBOutlet UILabel  *copyrightLabel;
    IBOutlet UILabel  *copyrightLabel2;
    IBOutlet UILabel  *statusLabel;
    IBOutlet UIActivityIndicatorView *spinner;
    IBOutlet UIImageView *logoView;
    IBOutlet UILabel *connectedDeviceLabel;
    IBOutlet UILabel *cdLabel;
    
    id  bluetoothEnabled;
    id btCont;
    id device;
}

@property (nonatomic, retain) UILabel  *programLabel;
@property (nonatomic, retain) UIButton *enableButton;
@property (nonatomic, retain) UILabel  *copyrightLabel;
@property (nonatomic, retain) UILabel  *copyrightLabel2;
@property (nonatomic, assign) id bluetoothEnabled;
@property (nonatomic, retain) id btCont;
@property (nonatomic, retain) UILabel  *statusLabel;
@property (nonatomic, retain) UIActivityIndicatorView *spinner;
@property (nonatomic, retain) UIImageView *logoView;
@property (nonatomic, retain) UILabel *connectedDeviceLabel;
@property (nonatomic, retain) UILabel *cdLabel;
@property (nonatomic, retain) id device;

-(IBAction)handleButtonPress:(id)sender;
-(void)showBTStatus;
-(void)deviceConnection:(NSNotification *)notification;
-(void)deviceDisconnection:(NSNotification *)notification;
-(void)bluetoothStateChange:(NSNotification *)notification;
-(void)bluetoothAvailableChange:(NSNotification *)notification;
@end
