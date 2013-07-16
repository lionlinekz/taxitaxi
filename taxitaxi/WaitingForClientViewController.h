//
//  WaitingForClientViewController.h
//  taxitaxi
//
//  Created by aldiar on 15.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTparser.h"
#import "TaxiRiders.h"
#import "LoginViewController.h"
#import "TaksometerViewController.h"


@interface WaitingForClientViewController : UIViewController{
    RESTparser *parser;
    NSString *orderID;
    NSTimer *timer;
    int timeSec;
    int timeMin;
    IBOutlet UILabel *timeLabel;
}

@property (nonatomic, retain) RESTparser *parser;
@property (nonatomic, retain) NSString *orderID;
@property (nonatomic, retain) NSTimer *timer;

@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic) int timeSec;
@property (nonatomic) int timeMin;

-(IBAction)go:(id)sender;

@end
