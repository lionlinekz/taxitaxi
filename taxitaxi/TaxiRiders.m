//
//  TaxiRiders.m
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "TaxiRiders.h"

@implementation TaxiRiders

@synthesize status, rating, age, car_color, car_model, car_number, license, loc_lat, loc_lng, name, sname, x;

-(id)initWithName: (NSString *)name1 sname: (NSString *)sname1 age: (NSString *)age1 license: (NSString *)license1 carNumber: (NSString *)carNumber carModel:(NSString *)carModel carColor: (NSString *)carColor locLat:(NSString *)locLat locLng:(NSString *)locLng status:(NSString *)status1 rating:(NSString *)rating1 x:(NSString *)password{
    
    self = [super init];
    if(self){
        name = name1;
        sname = sname1;
        age = age1;
        license = license1;
        car_number = carNumber;
        car_model = carModel;
        car_color = carColor;
        loc_lat = locLat;
        loc_lng = locLng;
        status = status1;
        rating = rating1;
        x = password;
    }
    return self;
}

-(void)updateLat:(NSString *)lat updateLng:(NSString *)lng{
    loc_lat = lat;
    loc_lng = lng;
}

@end
