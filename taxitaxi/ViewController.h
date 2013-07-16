//
//  ViewController.h
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTparser.h"
#import "SBJson.h"
#import "TaxiRiders.h"
#import "TaxiOrders.h"
#import "CurrentOrderstableViewController.h"
#import "TaksometerViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController{
    NSMutableArray *currentDriverOrders;
    NSString *ordersType;
}

@property (nonatomic, retain) NSMutableArray *currentDriverOrders;
@property (nonatomic, retain) NSString *ordersType;

@end
