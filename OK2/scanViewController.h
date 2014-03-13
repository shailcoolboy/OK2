//
//  scanViewController.h
//  ok
//
//  Created by shailendra on 3/6/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMScannerView.h"

@interface scanViewController : UIViewController < RMScannerViewDelegate,UIAlertViewDelegate, UIBarPositioningDelegate>

@property (strong, nonatomic) IBOutlet RMScannerView *scannerView;
@property (weak, nonatomic) IBOutlet UILabel *statusText;
@end
