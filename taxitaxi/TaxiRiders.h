//
//  TaxiRiders.h
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaxiRiders : NSObject {
    NSString *name;
    NSString *sname;
    NSString *age;
    NSString *license;
    NSString *car_number;
    NSString *car_model;
    NSString *car_color;
    NSString *loc_lat;
    NSString *loc_lng;
    NSString *status;//статус (0 – свободен, 1 – на заказе, 2 – обед, 3 – парковка, 4 – закончил смену)
    NSString *rating;//srednii rating voditeya
    NSString *x;//parol
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *sname;
@property (nonatomic, retain) NSString *age;
@property (nonatomic, retain) NSString *license;
@property (nonatomic, retain) NSString *car_number;
@property (nonatomic, retain) NSString *car_model;
@property (nonatomic, retain) NSString *car_color;
@property (nonatomic, retain) NSString *loc_lat;
@property (nonatomic, retain) NSString *loc_lng;

@property (nonatomic, retain) NSString *status;

@property (nonatomic, retain) NSString *rating;
@property (nonatomic, retain) NSString *x;

-(id)initWithName: (NSString *)name1 sname: (NSString *)sname1 age: (NSString *)age1 license: (NSString *)license1 carNumber: (NSString *)carNumber carModel:(NSString *)carModel carColor: (NSString *)carColor locLat:(NSString *)locLat locLng:(NSString *)locLng status:(NSString *)status1 rating:(NSString *)rating1 x:(NSString *)password;

-(void)updateLat:(NSString *)lat updateLng:(NSString *)lng;

@end
