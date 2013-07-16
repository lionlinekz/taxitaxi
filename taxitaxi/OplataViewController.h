//
//  OplataViewController.h
//  taxitaxi
//
//  Created by aldiar on 12.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OplataViewController : UIViewController{
    
    IBOutlet UILabel *distance;
    IBOutlet UILabel *time;
    IBOutlet UILabel *prostoi;
    IBOutlet UILabel *discount;
    IBOutlet UILabel *cost;
    
    NSString *distanceString;
    NSString *timeString;
    NSString *prostoiString;
    NSString *discountString;
    NSString *costString;
    
    NSString *awaitingTime;
}

@property (nonatomic, retain) NSString *distanceString;
@property (nonatomic, retain) NSString *timeString;
@property (nonatomic, retain) NSString *prostoiString;
@property (nonatomic, retain) NSString *discountString;
@property (nonatomic, retain) NSString *costString;

@property (nonatomic, retain) IBOutlet UILabel *distance;
@property (nonatomic, retain) IBOutlet UILabel *time;
@property (nonatomic, retain) IBOutlet UILabel *prostoi;
@property (nonatomic, retain) IBOutlet UILabel *discount;
@property (nonatomic, retain) IBOutlet UILabel *cost;

@property (nonatomic, retain) NSString *awaitingTime;

-(IBAction)payedButtonPressed:(id)sender;

@end
