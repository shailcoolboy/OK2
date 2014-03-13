//
//  ViewController.h
//  ok
//
//  Created by shailendra on 3/1/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface ViewController : UIViewController <UITextFieldDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)signin:(id)sender;

@end
