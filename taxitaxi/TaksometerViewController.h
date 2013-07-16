//
//  NavigatorViewController.h
//  taxitaxi
//
//  Created by aldiar on 25.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "PSLocationManager.h"
#import "OplataViewController.h"

@interface TaksometerViewController : UIViewController<MKMapViewDelegate>{
    IBOutlet UILabel *speed;
    IBOutlet UILabel *distanceTravelled;
    IBOutlet UILabel *signalStregnth;
    IBOutlet MKMapView *mapView;
    
    IBOutlet UIButton *checkButton;
    IBOutlet UIButton *startButton;
    IBOutlet UIButton *homeButton;
    //for switching between mapView and informationView
    IBOutlet UIButton *controlButton;
    
    int timeSec;
    int timeMin;
    NSTimer *timer;
    IBOutlet UILabel *timeLabel;
    
    IBOutlet UILabel *costLabel;
    
    NSString *viewControllerIdentifiyer;
    NSString *awaitingTimerTime;
    //a stands for flipping animation boolean variable
    BOOL a;
    IBOutlet UIView *newView;
}

@property (nonatomic, retain) IBOutlet UILabel *speed;
@property (nonatomic, retain) IBOutlet UILabel *distanceTravelled;
@property (nonatomic, retain) IBOutlet UILabel *signalStregnth;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) IBOutlet UIButton *checkButton;
@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) IBOutlet UIButton *homeButton;
@property (nonatomic, retain) IBOutlet UIButton *controlButton;

@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic) int timeSec;
@property (nonatomic) int timeMin;
@property (nonatomic, retain) NSTimer *timer;

@property (nonatomic, retain) IBOutlet UILabel *costLabel;
@property (nonatomic, retain) NSString *viewControllerIdentifiyer;
@property (nonatomic, retain) NSString *awaitingTimerTime;

//asset commit

-(IBAction)reset:(id)sender;
-(IBAction)goToHome:(id)sender;
-(IBAction)switchTo:(id)sender;

@end
