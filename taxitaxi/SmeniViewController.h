//
//  SmeniViewController.h
//  taxitaxi
//
//  Created by aldiar on 25.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBJson.h"
#import "RESTparser.h"
#import "LoginViewController.h"
#import "TaxiRiders.h"

@interface SmeniViewController : UIViewController{
    
    RESTparser *restParser;
}

-(IBAction)changeDriverStatus:(id)sender;

@property (nonatomic, retain) RESTparser *restParser;

@end
