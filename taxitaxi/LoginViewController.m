//
//  LoginViewController.m
//  taxitaxi
//
//  Created by aldiar on 02.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize loginField, passwordField, loginString, passwordString, taxiRider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static id login_var = nil;
static id password_var = nil;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [loginField setDelegate:self];
    [passwordField setDelegate:self];
    
	// Do any additional setup after loading the view.
}

-(IBAction)loginPressed:(id)sender{
    loginString = loginField.text;
    passwordString = passwordField.text;
    
    login_var = [NSString stringWithFormat:@"%@", loginString];
    password_var = [NSString stringWithFormat:@"%@", passwordString];
    
    //taxiRider = [[self class] getRider:loginString password:passwordString];
    
    RESTparser *restParser = [[RESTparser alloc] init];
    NSString *driver = [restParser getRequest:@"http://www.taxitaxi.kz/dispatcher/index.php/api/driverLogin" requestType:@"GET" value1:login_var header1:@"X_USERNAME" value2:password_var header2:@"X_PASSWORD" data:@""];
    
    //String response when user name or password incorrect
    NSString *errorString = @"Error: User Name is invalid";
    NSString *errorPass = @"Error: User Password is invalid";
    
    if([driver isEqualToString:errorString] || [driver isEqualToString:errorPass]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"login fail"
                                                        message:@"Incorrect login or password"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }else{
        taxiRider = [[self class] getRider];
        [self performSegueWithIdentifier:@"loginGood"sender:self];
    }
    
}


+(TaxiRiders*)getRider{
    static TaxiRiders *riders;
    if(riders == nil){
        RESTparser *restParser = [[RESTparser alloc] init];
        NSString *driver = [restParser getRequest:@"http://www.taxitaxi.kz/dispatcher/index.php/api/driverLogin" requestType:@"GET" value1:login_var header1:@"X_USERNAME" value2:password_var header2:@"X_PASSWORD" data:@""];
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSDictionary *parsedDict = [parser objectWithString:driver];
        
        NSString *name = [[parsedDict valueForKey:@"name"] objectAtIndex: 0];
        NSString *sname = [[parsedDict valueForKey:@"sname"] objectAtIndex: 0];
        NSString *age = [[parsedDict valueForKey:@"age"] objectAtIndex: 0];
        NSString *license = [[parsedDict valueForKey:@"license"] objectAtIndex: 0];
        NSString *carNumber = [[parsedDict valueForKey:@"car_number"] objectAtIndex: 0];
        NSString *carModel = [[parsedDict valueForKey:@"car_model"] objectAtIndex: 0];
        NSString *carColor = [[parsedDict valueForKey:@"car_color"] objectAtIndex: 0];
        NSString *locLat = [[parsedDict valueForKey:@"loc_lat"] objectAtIndex: 0];
        NSString *locLng = [[parsedDict valueForKey:@"loc_lng"] objectAtIndex: 0];
        NSString *status = [[parsedDict valueForKey:@"status"] objectAtIndex: 0];
        NSString *rating = [[parsedDict valueForKey:@"rating"] objectAtIndex: 0];
        NSString *password = [[parsedDict valueForKey:@"x"] objectAtIndex: 0];
        
        riders = [[TaxiRiders alloc] initWithName:name sname:sname age:age license:license carNumber:carNumber carModel:carModel carColor:carColor locLat:locLat locLng:locLng status:status rating:rating x:password];
    }
    return riders;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
