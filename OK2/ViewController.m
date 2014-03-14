//
//  ViewController.m
//  ok
//
//  Created by shailendra on 3/1/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+PPiAwesome.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"login@2x.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
   
    UIButton *login=[UIButton buttonWithType:UIButtonTypeCustom text:@"   Sign in!" icon:@"fa-sign-in" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [login addTarget:self action:@selector(signin:) forControlEvents:UIControlEventTouchUpInside];
    [login setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
    [login setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    
    login.frame=CGRectMake(95, 375, 180, 40);
    [login setRadius:0.0];
    [self.view addSubview:login];
    
   
    
    UIButton *facebook=[UIButton buttonWithType:UIButtonTypeCustom text:@"  Login with facebook" icon:@"fa-facebook" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
    [facebook setBackgroundColor:[UIColor colorWithRed:0.243 green:0.357 blue:0.6 alpha:1.0] forUIControlState:UIControlStateNormal];
    [facebook setBackgroundColor:[UIColor colorWithRed:0.502 green:0.573 blue:0.729 alpha:1.0] forUIControlState:UIControlStateHighlighted];
    
    facebook.frame=CGRectMake(95, 480, 180, 40);
    [facebook setRadius:0.0];
    [self.view addSubview:facebook];
    
    
    
    
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    if ([string isEqualToString:@"#"]) {
        return NO;
    }
    else {
        return YES;
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    NSLog(@"textFieldShouldClear:");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    if (textField.tag == 1) {
        UITextField *passwordTextField = (UITextField *)[self.view viewWithTag:2];
        [passwordTextField becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}


- (IBAction)signin:(id)sender {
    NSString *name = self.username.text;
    NSString *pass = self.password.text;
    [PFUser logInWithUsernameInBackground:name password:pass
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"login success:");
                                            //[self performSegueWithIdentifier:@"succ" sender:self];
                                            [self.navigationController popToRootViewControllerAnimated:YES];
                                            
                                        } else {
                                            NSLog(@"login failed:");
                                            // The login failed. Check error to see why.
                                        }
                                    }];
    
    
}
@end