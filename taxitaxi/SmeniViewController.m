//
//  SmeniViewController.m
//  taxitaxi
//
//  Created by aldiar on 25.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "SmeniViewController.h"

@interface SmeniViewController ()

@end

@implementation SmeniViewController

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
    [super viewDidLoad];
    restParser = [[RESTparser alloc] init];
    //creating the popup window
    
    //moving to the original view
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)changeDriverStatus:(id)sender{
    
    NSString *mesaage;
    
    TaxiRiders *rider = [LoginViewController getRider];
    if([sender tag] == 1){
        [restParser requestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/updateLocation" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" data:@"status=1"];
        mesaage = @"na smene";
    }else if([sender tag]==2){
        [restParser requestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/updateLocation" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" data:@"status=2"];
        mesaage = @"pereriv";
    }else if([sender tag]==3){
        [restParser requestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/updateLocation" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" data:@"status=3"];
        mesaage = @"parkovka";
    }else if([sender tag]==4){
        [restParser requestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/updateLocation" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" data:@"status=4"];
        mesaage = @"smena zavershena";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Smena uspeshno izmenena"
                                                    message:mesaage
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
