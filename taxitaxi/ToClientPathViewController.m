//
//  ToClientPathViewController.m
//  taxitaxi
//
//  Created by aldiar on 15.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "ToClientPathViewController.h"

@interface ToClientPathViewController ()

@end

@implementation ToClientPathViewController

@synthesize parser, orderID;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)atAdressClient:(id)sender{
    TaxiRiders *rider = [LoginViewController getRider];
    
    [parser acceptRequestrequestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/arrivedToLocation" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" value3:orderID header3:@"X_ORDER" data:@""];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WaitingForClientViewController *destViewController = segue.destinationViewController;
    destViewController.orderID = orderID;
}


@end
