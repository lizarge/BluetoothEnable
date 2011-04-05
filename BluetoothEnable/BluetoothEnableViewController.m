//
//  BluetoothEnableViewController.m
//  BluetoothEnable
//
//  Created by Jeff McLeman on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BluetoothEnableViewController.h"
@class BluetoothManager, BluetoothDevice;

@implementation BluetoothEnableViewController
@synthesize programLabel;
@synthesize enableButton;
@synthesize copyrightLabel;
@synthesize copyrightLabel2;
@synthesize bluetoothEnabled;
@synthesize btCont;
@synthesize statusLabel;
@synthesize logoView;
@synthesize spinner;
@synthesize cdLabel;
@synthesize connectedDeviceLabel;
@synthesize device;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(bluetoothAvailableChange:) name:@"BluetoothConnectionStatusChangedNotification" object:nil];
    [nc addObserver:self selector:@selector(deviceDisconnection:) name:@"BluetoothDeviceDisconnectSuccessNotification" object:nil];
    [nc addObserver:self selector:@selector(deviceConnection:) name:@"BluetoothDeviceConnectSuccessNotification" object:nil];
    [nc addObserver:self selector:@selector(bluetoothStateChange:) name:@"BluetoothPowerChangedNotification" object:nil];

    [connectedDeviceLabel setText:@"No Device Connected"];
    Class BluetoothManager = objc_getClass("BluetoothManager");
    btCont = [BluetoothManager sharedInstance];

    NSLog(@"Does BT Manager respond to sharedInstance? %@", btCont);
    // Delay and poll the first time
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 1 *NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{ [self showBTStatus]; });
}

-(void)showBTStatus {
    BOOL btStatus = [btCont enabled];
    NSLog(@"Current Bluetooth State: %d",btStatus);
    [enableButton setTitle:btStatus ? @"Disable" :@"Enable" forState:UIControlStateNormal];
    
    [statusLabel setText:btStatus ? @"Enabled" :@"Disabled"];
    [statusLabel setTextColor:btStatus ? [UIColor greenColor] : [UIColor redColor]];
    [spinner stopAnimating];
    [spinner setHidden:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.btCont = nil;
    self.device = nil;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:@"BluetoothConnectionStatusChangedNotification" object:nil];
    [nc removeObserver:self name:@"BluetoothDeviceDisconnectSuccessNotification" object:nil];
    [nc removeObserver:self name:@"BluetoothDeviceConnectSuccessNotification" object:nil];
    [nc removeObserver:self name:@"BluetoothPowerChangedNotification" object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)handleButtonPress:(id)sender {
    [spinner setHidden:NO];
    [spinner startAnimating];
    NSLog(@"Button Pressed");
    [self.btCont setEnabled:![self.btCont enabled]];

    
}
-(void)connectedDevice {
    
    Class BluetoothDevice = objc_getClass("BluetoothDevice");
    NSArray *devices = [self.btCont connectedDevices];
    if ([devices count] != 0) {
        device = [devices objectAtIndex:0];
        NSLog(@"Device is:%@",device );
        [connectedDeviceLabel setText:[device name]];
    } 
}
-(void)deviceConnection:(NSNotification *)notification {
    
    NSLog(@"Got a device Connect notification");
    [self connectedDevice];
}
-(void)deviceDisconnection:(NSNotification *)notification {
    
    NSLog(@"Got a device disconnect notification");
    [connectedDeviceLabel setText:@"No Device Connected"];

}

-(void)bluetoothAvailableChange:(NSNotification *)notification {
    
    NSLog(@"Got an availability change");
    [self showBTStatus];
}
-(void)bluetoothStateChange:(NSNotification *)notification {
    [self showBTStatus];

}
@end
