//
//  NavigatorViewController.m
//  taxitaxi
//
//  Created by aldiar on 25.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "TaksometerViewController.h"

@interface TaksometerViewController ()

@end

@implementation TaksometerViewController
@synthesize mapView, signalStregnth, speed, distanceTravelled, checkButton, timeLabel, timeMin, timer, timeSec, viewControllerIdentifiyer, homeButton, startButton, controlButton, costLabel, awaitingTimerTime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.hidesBackButton = YES;
    if([viewControllerIdentifiyer isEqualToString:@"mainVC"]){
        [homeButton setHidden:NO];
        [startButton setHidden:NO];
    }else{
        [homeButton setHidden:YES];
        [startButton setHidden:YES];
    }
    
    [super viewDidLoad];
    [self StartTimer];
    
    [PSLocationManager sharedLocationManager].delegate = self;
    [[PSLocationManager sharedLocationManager] prepLocationUpdates];
    [[PSLocationManager sharedLocationManager] startLocationUpdates];
    
    mapView.delegate = self;
    mapView.showsUserLocation = YES;
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    newView = [[UIView alloc] init];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    OplataViewController *destViewController = segue.destinationViewController;
    
    destViewController.awaitingTime = [NSString stringWithFormat:@"%@;%@", timeLabel.text, distanceTravelled];
}






- (IBAction)flip:(id)sender
{
    if (a == NO) {
        [UIView transitionFromView:mapView toView:newView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        completion:NULL];
        a = YES;
    }
    else {
        [UIView transitionFromView:newView toView:mapView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        completion:NULL];
        a = NO;
    }
}

-(IBAction)switchTo:(id)sender{
    if([mapView isHidden]){
        [controlButton setTitle:@"Obichno" forState:UIControlStateNormal];
        [UIView animateWithDuration:1.0
                         animations:^{
                             self.mapView.alpha=1.0;
                         }
                         completion:^(BOOL finished){
                             self.mapView.hidden=NO;
                         }];
        
    }else{
        [controlButton setTitle:@"Karta" forState:UIControlStateNormal];
        [UIView animateWithDuration:1.0
                         animations:^{
                             self.mapView.alpha=0.0;
                         }
                         completion:^(BOOL finished){
                             self.mapView.hidden=YES;
                         }];
    }
}


-(IBAction)goToHome:(id)sender{
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}


//start timer
-(void) StartTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

//Event called every time the NSTimer ticks.
- (void)timerTick:(NSTimer *)timer
{
    timeSec++;
    if (timeSec == 60)
    {
        timeSec = 0;
        timeMin++;
    }
    //Format the string 00:00
    NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d", timeMin, timeSec];
    //Display on your label
    //[timeLabel setStringValue:timeNow];
    timeLabel.text= timeNow;
}

//stop timer
- (void) StopTimer
{
    [timer invalidate];
    timeSec = 0;
    timeMin = 0;
    //Since we reset here, and timerTick won't update your label again, we need to refresh it again.
    //Format the string in 00:00
    NSString* timeNow = [NSString stringWithFormat:@"%02d:%02d", timeMin, timeSec];
    //Display on your label
    // [timeLabel setStringValue:timeNow];
    timeLabel.text= timeNow;
}

-(IBAction)reset:(id)sender{
    [[PSLocationManager sharedLocationManager] prepLocationUpdates];
    [[PSLocationManager sharedLocationManager] resetDistance];
    [[PSLocationManager sharedLocationManager] startLocationUpdates];
    speed.text = @"Skorost:";
    signalStregnth.text = @"Sila Signala:";
    distanceTravelled.text = @"Distanciya:";
    [self StopTimer];
}


- (void)locationManager:(PSLocationManager *)locationManager signalStrengthChanged:(PSLocationManagerGPSSignalStrength)signalStrength {
    NSString *strengthText;
    if (signalStrength == PSLocationManagerGPSSignalStrengthWeak) {
        strengthText = NSLocalizedString(@"Weak", @"");
    } else if (signalStrength == PSLocationManagerGPSSignalStrengthStrong) {
        strengthText = NSLocalizedString(@"Strong", @"");
    } else {
        strengthText = NSLocalizedString(@"...", @"");
    }
    
    self.signalStregnth.text = [NSString stringWithFormat:@"Sila Signala: %@", strengthText];
}

- (void)locationManagerSignalConsistentlyWeak:(PSLocationManager *)locationManager {
    self.signalStregnth.text = NSLocalizedString(@"Consistently Weak", @"");
}

- (void)locationManager:(PSLocationManager *)locationManager distanceUpdated:(CLLocationDistance)distance {
    //converting from meters to km
    distance/=1000;
    
    self.distanceTravelled.text = [NSString stringWithFormat:@"Distanciya: %@",[NSString stringWithFormat:@"%.1f %@", distance, NSLocalizedString(@"km", @"")]];
    NSString *test1 = [NSString stringWithFormat:@"%lf", [[PSLocationManager sharedLocationManager] currentSpeed]];
    self.speed.text = [NSString stringWithFormat:@"Skorost: %@", [NSString stringWithFormat:@"%.0f", test1]];
    float path = distance;
    
    //cena zakaza v real time
    float r = path*100.0;
    
    NSString *myString = [[NSNumber numberWithFloat:r] stringValue];
    
    self.costLabel.text = [NSString stringWithFormat:@"%@", myString];
}

- (void)locationManager:(PSLocationManager *)locationManager error:(NSError *)error {
    // location services is probably not enabled for the app
    self.signalStregnth.text = NSLocalizedString(@"Unable to determine location", @"");
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
