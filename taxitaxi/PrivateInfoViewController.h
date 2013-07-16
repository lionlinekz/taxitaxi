//
//  PrivateInfoViewController.h
//  taxitaxi
//
//  Created by aldiar on 24.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "TaxiOrders.h"

@interface PrivateInfoViewController : UIViewController{
    IBOutlet UILabel *name;
    IBOutlet UILabel *sname;
    IBOutlet UILabel *age;
    IBOutlet UILabel *license;
    IBOutlet UILabel *carNumber;
    IBOutlet UILabel *carModel;
    IBOutlet UILabel *carColor;
    IBOutlet UILabel *status;
    IBOutlet UILabel *rating;
}

@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *sname;
@property (nonatomic, retain) IBOutlet UILabel *age;

@property (nonatomic, retain) IBOutlet UILabel *license;
@property (nonatomic, retain) IBOutlet UILabel *carNumber;
@property (nonatomic, retain) IBOutlet UILabel *carModel;

@property (nonatomic, retain) IBOutlet UILabel *carColor;
@property (nonatomic, retain) IBOutlet UILabel *status;
@property (nonatomic, retain) IBOutlet UILabel *rating;
@end
