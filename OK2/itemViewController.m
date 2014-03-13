//
//  itemViewController.m
//  ok
//
//  Created by shailendra on 3/5/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import "itemViewController.h"

@interface itemViewController ()

@end

@implementation itemViewController
@synthesize bar;

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
    
    static NSString *shail=@"shail";
    static NSString *const BaseURLString = @"http://api.v3.factual.com/t/products-cpg?filters={\"upc\":\"";
    static NSString *const end = @"\"}";
    NSString *key = @"&KEY=cMdz5RveZB3O41652uzS5NIVOUtT9iVr9Bf5SgjC";
     NSString *joinString=[NSString stringWithFormat:@"%@%@%@%@",BaseURLString,shail,end,key];
     NSString *weatherUrl = joinString;
     NSURL *url=[NSURL URLWithString:weatherUrl];
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.bar.text=weatherUrl;//self.barcod;
    
    
    
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
