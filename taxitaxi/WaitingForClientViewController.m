//
//  WaitingForClientViewController.m
//  taxitaxi
//
//  Created by aldiar on 15.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "WaitingForClientViewController.h"

@interface WaitingForClientViewController ()

@end

@implementation WaitingForClientViewController

@synthesize parser, orderID, timeLabel, timeMin, timer, timeSec;

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
    [super viewDidLoad];
    [self StartTimer];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TaksometerViewController *destViewController = segue.destinationViewController;
    destViewController.awaitingTimerTime = timeLabel.text;
}


-(IBAction)go:(id)sender{
    TaxiRiders *rider = [LoginViewController getRider];
    
    [parser acceptRequestrequestUrl:@"http://www.taxitaxi.kz/dispatcher/index.php/api/pickedUp" requestType:@"POST" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" value3:orderID header3:@"X_ORDER" data:@""];
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

@end
