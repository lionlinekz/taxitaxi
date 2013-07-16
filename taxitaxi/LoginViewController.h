//
//  LoginViewController.h
//  taxitaxi
//
//  Created by aldiar on 02.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TaxiRiders.h"
#import "RESTparser.h"

@interface LoginViewController : UIViewController{
    IBOutlet UITextField *loginField;
    IBOutlet UITextField *passwordField;
    
    NSString *loginString;
    NSString *passwordString;
    
    TaxiRiders *taxiRider;
}

@property (nonatomic, retain) IBOutlet UITextField *loginField;
@property (nonatomic, retain) IBOutlet UITextField *passwordField;

@property (nonatomic, retain) NSString *loginString;
@property (nonatomic, retain) NSString *passwordString;

@property (nonatomic, retain) TaxiRiders *taxiRider;

-(IBAction)loginPressed:(id)sender;

+(TaxiRiders*)getRider;


@end
