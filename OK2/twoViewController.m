//
//  twoViewController.m
//  OK2
//
//  Created by shailendra on 3/13/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import "twoViewController.h"
#import "TWRProgressView.h"
#import "UIButton+PPiAwesome.h"

@interface twoViewController (){
float _progress;
}
@property (weak, nonatomic) IBOutlet TWRProgressView *progressView;
@property (weak, nonatomic) IBOutlet TWRProgressView *progressViewSlider;
@end



@implementation twoViewController


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
    
    CGRect progressViewRect = CGRectMake(100, 300, 100, 100);
    UIImage *someImage = [UIImage imageNamed:@"bottle2.png"];
    TWRProgressView *progressView = [TWRProgressView progressViewWithFrame:progressViewRect
                                                           andMaskingImage:someImage];
    [progressView setFrontColor:[UIColor yellowColor]];
    [progressView setProgress:0.9];
    
    [self.view addSubview:progressView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    _progress = 0.5;
    [_progressView setProgress:_progress];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
