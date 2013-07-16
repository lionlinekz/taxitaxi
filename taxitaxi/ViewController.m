//
//  ViewController.m
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize currentDriverOrders, ordersType;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.view setNeedsDisplay];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CurrentOrderstableViewController *destViewController = segue.destinationViewController;
    
    if([[segue identifier] isEqualToString:@"CurrentOrder"]){
        destViewController.ordersType = @"CurrentOrder";
    }else if([[segue identifier] isEqualToString:@"AwaitingOrder"]){
        destViewController.ordersType = @"AwaitingOrder";
    }else if([[segue identifier] isEqualToString:@"MyOrder"]){
        destViewController.ordersType = @"MyOrder";
    }else if ([[segue identifier] isEqualToString:@"taksometerSegue"]){
        TaksometerViewController *taksometer = segue.destinationViewController;
        taksometer.viewControllerIdentifiyer = @"mainVC";
    }
    
}


@end
