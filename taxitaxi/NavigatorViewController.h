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

@interface NavigatorViewController : UIViewController<MKMapViewDelegate>{
    IBOutlet MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
