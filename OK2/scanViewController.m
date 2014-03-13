//
//  scanViewController.m
//  ok
//
//  Created by shailendra on 3/6/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import "scanViewController.h"
#import "listViewController.h"

@interface scanViewController ()
@property (nonatomic) NSString * barcode1;
@end

@implementation scanViewController
@synthesize scannerView, statusText;;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Set verbose logging to YES so we can see exactly what's going on
    [scannerView setVerboseLogging:YES];
    
    // Set animations to YES for some nice effects
    [scannerView setAnimateScanner:YES];
    
    // Set code outline to YES for a box around the scanned code
    [scannerView setDisplayCodeOutline:YES];
    
    // Start the capture session when the view loads - this will also start a scan session
    [scannerView startCaptureSession];
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didScanCode:(NSString *)scannedCode onCodeType:(NSString *)codeType {
    
    
    self.barcode1 = scannedCode;//[NSString stringWithFormat:@"%@", [message:scannedCode]];
    if ([self.barcode1 hasPrefix:@"0"] && [self.barcode1 length] > 12) {
        self.barcode1 = [self.barcode1 substringFromIndex:1];
    }
    [self performSegueWithIdentifier:@"api" sender:self];
    //[alert show];
}

- (void)errorGeneratingCaptureSession:(NSError *)error {
    [scannerView stopCaptureSession];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unsupported Device" message:@"This device does not have a camera. Run this app on an iOS device that has a camera." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    
    statusText.text = @"Unsupported Device";
    //self.sessionToggleButton.title = @"Error";
}

- (void)errorAcquiringDeviceHardwareLock:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Focus Unavailable" message:@"Tap to focus is currently unavailable. Try again in a little while." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alert show];
}

- (BOOL)shouldEndSessionAfterFirstSuccessfulScan {
    // Return YES to only scan one barcode, and then finish - return NO to continually scan.
    // If you plan to test the return NO functionality, it is recommended that you remove the alert view from the "didScanCode:" delegate method implementation
    // The Display Code Outline only works if this method returns NO
    return YES;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"api"]){
        
        UINavigationController *navController = (UINavigationController*)segue.destinationViewController;
        listViewController *controller1 =  (listViewController*)navController.topViewController;
        controller1.barcod = self.barcode1;
    }
}


@end
