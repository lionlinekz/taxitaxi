//
//  PrivateInfoViewController.m
//  taxitaxi
//
//  Created by aldiar on 24.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "PrivateInfoViewController.h"

@interface PrivateInfoViewController ()

@end

@implementation PrivateInfoViewController

@synthesize name, sname, carColor, carModel, carNumber, rating, status, age
, license;

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

-(void)viewWillAppear:(BOOL)animated{
    TaxiRiders *rider = [LoginViewController getRider];
    
    name.text = [NSString stringWithFormat:@"Imya: %@",rider.name];
    sname.text = [NSString stringWithFormat:@"Familiya: %@",rider.sname];
    carNumber.text = [NSString stringWithFormat:@"Nomer mashini: %@",rider.car_number];
    carModel.text = [NSString stringWithFormat:@"Marka: %@",rider.car_model];
    carColor.text = [NSString stringWithFormat:@"Cvet: %@",rider.car_color];
    rating.text = [NSString stringWithFormat:@"Rating: %@",rider.rating];
    status.text = [NSString stringWithFormat:@"Status: %@",rider.status];
    age.text = [NSString stringWithFormat:@"Vozrast: %@",rider.age];
    license.text = [NSString stringWithFormat:@"Licensiya: %@",rider.license];
}

@end
