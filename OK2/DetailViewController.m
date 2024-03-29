//
//  DetailViewController.m
//  OK2
//
//  Created by shailendra on 3/13/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import "DetailViewController.h"
#import "UIButton+PPiAwesome.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize name;
@synthesize brand,cal,serve,weight;
@synthesize ingredients;


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
    self.navigationItem.hidesBackButton = YES;
 
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
        self.name.text = [Detail objectForKey:@"product_name"];
        self.brand.text = [Detail objectForKey:@"brand"];
        NSArray *ing = [Detail objectForKey:@"ingredients"];
        
        NSString *cal1=[Detail objectForKey:@"calories"];
        NSInteger calint = [cal1 intValue];
        //self.cal.text = calo;
        [self.cal setText:[NSString stringWithFormat:@"%d", calint]];
        //self.cal.text = [NSString stringWithFormat:@"%d",
         //                   [[Detail objectForKey:@"calories"] intValue]];
        NSArray *w= [Detail objectForKey:@"size"];
        //self.weight.text = [w lastObject];
        
        
        self.weight.text=[[[w lastObject] componentsSeparatedByString:@";"] lastObject];
        
        
        self.serve.text = [Detail objectForKey:@"serving_size"];

        //NSString *result = [[ing valueForKey:@"description"] componentsJoinedByString:@","];
        //NSString *result = [ing description];
        NSString *result=[ing componentsJoinedByString:@", "];
        
        self.ingredients.text = result;
                     
        [_bgimage setImageWithURL:[NSURL URLWithString:[image lastObject]]
                  placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        NSLog(@"The Array: %d",calint);
        
        
        
        UIButton *add=[UIButton buttonWithType:UIButtonTypeCustom text:@"   Add Item!" icon:@"fa-plus" textAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]} andIconPosition:IconPositionLeft];
        [add addTarget:self action:@selector(addin:) forControlEvents:UIControlEventTouchUpInside];
        [add setBackgroundColor:[UIColor colorWithRed:205.0f/255 green:35.0f/255 blue:44.0f/255 alpha:1.0] forUIControlState:UIControlStateNormal];
        [add setBackgroundColor:[UIColor colorWithRed:244.0f/255 green:61.0f/255 blue:91.0f/255 alpha:1.0] forUIControlState:UIControlStateHighlighted];
        
        add.frame=CGRectMake(75, 475, 180, 40);
        [add setRadius:0.0];
        [self.view addSubview:add];

        
        
        
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



- (IBAction)addin:(id)sender {
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

//- (IBAction)home:(id)sender {
//}

@end
