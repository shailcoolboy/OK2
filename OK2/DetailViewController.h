//
//  DetailViewController.h
//  OK2
//
//  Created by shailendra on 3/13/14.
//  Copyright (c) 2014 shailendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeTableViewController.h"

@interface DetailViewController : UIViewController
@property(nonatomic) NSString *barcod;
@property (nonatomic,strong) NSArray *item;
@property (weak, nonatomic) IBOutlet UIImageView *bgimage;
@property (weak, nonatomic) IBOutlet UILabel *brand;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextView *ingredients;
@property (weak, nonatomic) IBOutlet UILabel *cal;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *serve;
- (IBAction)addin:(id)sender;

@end
