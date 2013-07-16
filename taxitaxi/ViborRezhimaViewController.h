//
//  ViborRezhimaViewController.h
//  taxitaxi
//
//  Created by aldiar on 11.07.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESTparser.h"
#import "LoginViewController.h"

@interface ViborRezhimaViewController : UIViewController{
    RESTparser *restParser;
}

@property (nonatomic, retain) RESTparser *restParser;

-(IBAction)makeDecision:(id)sender;

@end
