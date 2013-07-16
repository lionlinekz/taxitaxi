//
//  TaxiOrders.m
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "TaxiOrders.h"

@implementation TaxiOrders

@synthesize cost, date, des_lat, des_lng, did, notes, or_lat, or_lng, rating, status, time, type, uid, orderID, fromAdres, whereAdres;

-(id)initWithUserId: (NSString*)uid1 driverId:(NSString*)did1 type:(NSString*)type1 notes:(NSString*)notes1 orLat:(NSString*)orLat orLng:(NSString*)orLng desLat:(NSString*)desLat desLng:(NSString*)desLng cost:(NSString*)cost1 rating:(NSString*)rating1 date:(NSString*)date1 time:(NSString*)time1 status:(NSString*)status1{
    
    self = [super init];
    if(self){
        uid = uid1;
        did = did1;
        type = type1;
        notes = notes1;
        or_lat = orLat;
        or_lng = orLng;
        des_lat = desLat;
        des_lng = desLng;
        cost = cost1;
        rating = rating1;
        date = date1;
        time = time1;
        status = status1;
    }
    return self;
}

-(id)initWithOrderId:(NSString*)id1 userId: (NSString*)uid1 driverId:(NSString*)did1 type:(NSString*)type1 notes:(NSString*)notes1 orLat:(NSString*)orLat orLng:(NSString*)orLng desLat:(NSString*)desLat desLng:(NSString*)desLng cost:(NSString*)cost1 rating:(NSString*)rating1 date:(NSString*)date1 time:(NSString*)time1 status:(NSString*)status1{
    
    self = [super init];
    if(self){
        orderID = id1;
        uid = uid1;
        did = did1;
        type = type1;
        notes = notes1;
        or_lat = orLat;
        or_lng = orLng;
        des_lat = desLat;
        des_lng = desLng;
        cost = cost1;
        rating = rating1;
        date = date1;
        time = time1;
        status = status1;
    }
    return self;
}

@end
