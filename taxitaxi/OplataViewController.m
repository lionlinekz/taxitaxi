//
//  OplataViewController.m
//  taxitaxi
//
//  Created by aldiar on 12.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "OplataViewController.h"

@interface OplataViewController ()

@end

@implementation OplataViewController

@synthesize costString, prostoiString, discountString, distanceString, timeString, time, prostoi, discount, distance, cost, awaitingTime;

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
    self.navigationItem.hidesBackButton = YES;
    [super viewDidLoad];
    
    time.text = [NSString stringWithFormat:@"Vremya: ,%@", timeString];
    cost.text = costString;
    distance.text = [NSString stringWithFormat:@"Rastoyanie: %@", distanceString];
    discount.text = @"0";
    prostoi.text = [NSString stringWithFormat:@"Prostoi: %@", awaitingTime];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)payedButtonPressed:(id)sender{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

@end
