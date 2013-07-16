//
//  TaxiOrders.h
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaxiOrders : NSObject {
    NSString *orderID;
    
    NSString *uid;
    NSString *did;
    NSString *type; //tip zakaza
    NSString *notes;
    
    NSString *or_lat;//originalnaya shirota
    NSString *or_lng;//originalnaya dolgota
    
    NSString *des_lat;
    NSString *des_lng;
    
    NSString *cost;
    NSString *rating;//ocenka zakaza ot 1 do 5
    NSString *date;
    NSString *time;
    NSString *status;//0 ne podverzhden/ne vipolnyaetsya, 1 vipolnyaetsya, 2 zavershen
    
    NSString *fromAdres;
    NSString *whereAdres;
    
}

@property (nonatomic, retain) NSString *orderID;

@property (nonatomic, retain) NSString* uid;
@property (nonatomic, retain) NSString* did;
@property (nonatomic, retain) NSString* type;

@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSString *or_lat;
@property (nonatomic, retain) NSString *or_lng;
@property (nonatomic, retain) NSString *des_lat;
@property (nonatomic, retain) NSString *des_lng;

@property (nonatomic, retain) NSString *cost;
@property (nonatomic, retain) NSString* rating;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString* status;

@property (nonatomic, retain) NSString *fromAdres;
@property (nonatomic, retain) NSString *whereAdres;

-(id)initWithUserId: (NSString*)uid1 driverId:(NSString*)did1 type:(NSString*)type1 notes:(NSString*)notes1 orLat:(NSString*)orLat orLng:(NSString*)orLng desLat:(NSString*)desLat desLng:(NSString*)desLng cost:(NSString*)cost1 rating:(NSString*)rating1 date:(NSString*)date1 time:(NSString*)time1 status:(NSString*)status1;

-(id)initWithOrderId:(NSString*)id1 userId: (NSString*)uid1 driverId:(NSString*)did1 type:(NSString*)type1 notes:(NSString*)notes1 orLat:(NSString*)orLat orLng:(NSString*)orLng desLat:(NSString*)desLat desLng:(NSString*)desLng cost:(NSString*)cost1 rating:(NSString*)rating1 date:(NSString*)date1 time:(NSString*)time1 status:(NSString*)status1;

@end
