//
//  BluetoothEnableViewController.m
//  BluetoothEnable
//
//  Created by Jeff McLeman on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BluetoothEnableViewController.h"
@class BluetoothManager;

@implementation BluetoothEnableViewController
@synthesize programLabel;
@synthesize enableButton;
@synthesize copyrightLabel;
@synthesize copyrightLabel2;
@synthesize bluetoothEnabled;
@synthesize btCont;
@synthesize statusLabel;

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
    Class BluetoothManager = objc_getClass("BluetoothManager");
    btCont = [BluetoothManager sharedInstance];
    
    NSLog(@"Does BT Manager respond to sharedInstance? %@", btCont);
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{ [self showBTStatus];});
}

-(void)showBTStatus {
    BOOL btStatus = [btCont enabled];
    NSLog(@"Current Bluetooth State: %d",btStatus);
    [enableButton setTitle:btStatus ? @"Disable" :@"Enable" forState:UIControlStateNormal];
    
    [statusLabel setText:btStatus ? @"Enabled" :@"Disabled"];
    [statusLabel setTextColor:btStatus ? [UIColor greenColor] : [UIColor redColor]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    btCont = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)handleButtonPress:(id)sender {
    
    NSLog(@"Button Pressed");
    [self.btCont setEnabled:![self.btCont enabled]];
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(delay, dispatch_get_main_queue(), ^{ [self showBTStatus];});

    
}
@end
