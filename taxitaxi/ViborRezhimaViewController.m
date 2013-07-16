//
//  ViborRezhimaViewController.m
//  taxitaxi
//
//  Created by aldiar on 11.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "ViborRezhimaViewController.h"

@interface ViborRezhimaViewController ()

@end

@implementation ViborRezhimaViewController

@synthesize restParser;

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
    restParser = [[RESTparser alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)makeDecision:(id)sender{
    
    NSString *mesaage;
    TaxiRiders *rider = [LoginViewController getRider];
    
    
    if([sender tag] == 1){
        [restParser requestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/updateLocation" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" data:@"status=5"];
        mesaage = @"ti teper taxisist";
    }else if ([sender tag] == 2){
        [restParser requestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/updateLocation" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" data:@"status=6"];
        mesaage = @"ti teper trezvii voditel";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Smena uspeshno izmenena"
                                                    message:mesaage
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
