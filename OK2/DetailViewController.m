//
//  DetailViewController.m
//  OK2
//
//  Created by shailendra on 3/13/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
        
    //NSString *shail = @"363824730165";
    static NSString *const BaseURLString = @"http://api.v3.factual.com/t/products-cpg-nutrition?filters={\"upc\":\"";
    static NSString *const end = @"\"}";
    NSString *key = @"&KEY=cMdz5RveZB3O41652uzS5NIVOUtT9iVr9Bf5SgjC";
    NSString *joinString=[NSString stringWithFormat:@"%@%@%@%@",BaseURLString,self.barcod,end,key];
    NSString *weatherUrl = joinString;
    //NSURL *url=[NSURL URLWithString:weatherUrl];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSString *properlyEscapedURL = [weatherUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:properlyEscapedURL]];
    //self.bar.text=weatherUrl;//self.barcod;
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3
        NSDictionary *dict=[responseObject objectForKey:@"response"];
        self.item = [dict objectForKey:@"data"];
        
        NSDictionary *Detail = self.item[0];
        NSArray *image = [Detail objectForKey:@"image_urls"];
        
        
        NSLog(@"The Array: %@",[image lastObject]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"This is it: %@", joinString);
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
    

    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
