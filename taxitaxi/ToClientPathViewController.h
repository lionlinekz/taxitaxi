//
//  ToClientPathViewController.h
//  taxitaxi
//
//  Created by aldiar on 15.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTparser.h"
#import "TaxiRiders.h"
#import "LoginViewController.h"
#import "WaitingForClientViewController.h"


@interface ToClientPathViewController : UIViewController{
    RESTparser *parser;
    NSString *orderID;
}

@property (nonatomic, retain) RESTparser *parser;
@property (nonatomic, retain) NSString *orderID;

-(IBAction)atAdressClient:(id)sender;

@end
