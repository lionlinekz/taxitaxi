//
//  OrderDetailsViewController.h
//  taxitaxi
//
//  Created by aldiar on 02.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTparser.h"
#import "LoginViewController.h"
#import "TaxiRiders.h"
#import "TaxiOrders.h"
#import "ToClientPathViewController.h"

@interface OrderDetailsViewController : UIViewController{
    
    IBOutlet UILabel *whereAdresLabel;
    NSString *whereAdresString;
    
    IBOutlet UILabel *fromAdresLabel;
    NSString *fromAdresString;
    
    IBOutlet UILabel *costLabel;
    NSString *costString;
    
    NSString *orderID;
    
    IBOutlet UIButton *acceptButtom;
    
    RESTparser *parser;
}

@property (nonatomic, retain) IBOutlet UILabel *whereAdresLabel;
@property (nonatomic, retain) NSString *whereAdresString;

@property (nonatomic, retain) IBOutlet UILabel *fromAdresLabel;
@property (nonatomic, retain) NSString *fromAdresString;

@property (nonatomic, retain) IBOutlet UILabel *costLabel;
@property (nonatomic, retain) NSString *costString;

@property (nonatomic, retain) NSString *orderID;
@property (nonatomic, retain) IBOutlet UIButton *acceptButtom;

@property (nonatomic, retain) RESTparser *parser;

-(IBAction)acceptOrder:(id)sender;

@end
