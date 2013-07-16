//
//  CurrentOrderstableViewController.h
//  taxitaxi
//
//  Created by aldiar on 21.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaxiOrders.h"
#import "TaxiRiders.h"
#import "SBJson.h"
#import "CustomTableCell.h"
#import "RESTparser.h"
#import "LoginViewController.h"
#import "OrderDetailsViewController.h"

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>

@interface CurrentOrderstableViewController : UITableViewController{
    NSMutableArray *orderArray;
    NSMutableArray *currentAdressArray;
    NSMutableArray *destanationAdressArray;
    
    NSMutableArray *adresDictArray;
    
    NSString *desAdres;
    
    IBOutlet UITableView *tableView;
    SBJsonParser *parser;
    
    NSString *ordersType;
}

@property (nonatomic, retain) NSMutableArray *orderArray;
@property (nonatomic, retain) NSMutableArray *currentAdressArray;
@property (nonatomic, retain) NSMutableArray *destanationAdressArray;
@property (nonatomic, retain) NSMutableArray *adresDictArray;
@property (nonatomic, retain) NSString *ordersType;

-(NSString*)convertLat:(double)lat longitude:(double)lng;
@end
