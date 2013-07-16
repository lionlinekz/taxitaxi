//
//  OrderDetailsViewController.m
//  taxitaxi
//
//  Created by aldiar on 02.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "OrderDetailsViewController.h"

@interface OrderDetailsViewController ()

@end

@implementation OrderDetailsViewController

@synthesize whereAdresLabel, whereAdresString, fromAdresLabel, fromAdresString, costLabel, costString, orderID, acceptButtom, parser;

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
    parser = [[RESTparser alloc] init];
    
    [super viewDidLoad];
    whereAdresLabel.text = [NSString stringWithFormat:@"Where: %@", whereAdresString];
    fromAdresLabel.text = [NSString stringWithFormat:@"From: %@", fromAdresString];
    costLabel.text = [NSString stringWithFormat:@"Cost: %@", costString];
}

- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)acceptOrder:(id)sender{
    TaxiRiders *rider = [LoginViewController getRider];
    
    [parser acceptRequestrequestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/acceptOrder" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" value3:orderID header3:@"X_ORDER" data:@""];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ToClientPathViewController *destViewController = segue.destinationViewController;
    destViewController.orderID = orderID;
}

@end
