//
//  RESTparser.h
//  taxitaxi
//
//  Created by aldiar on 21.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RESTparser : NSObject {
    NSMutableURLRequest *mutableRequest;
    NSString *resquest;
}

@property (nonatomic, retain) NSString *request;
@property (nonatomic, retain) NSMutableURLRequest *mutableRequest;

-(NSString *)getRequest: (NSString *)url requestType: (NSString *)requestType value1: (NSString *)setValue1 header1: (NSString *)headerValue1 value2: (NSString *)setValue2 header2: (NSString *)headerValue2 data:(NSString*)stringData;

-(void)requestUrl: (NSString *)url requestType: (NSString *)requestType value1: (NSString *)setValue1 header1: (NSString *)headerValue1 value2: (NSString *)setValue2 header2: (NSString *)headerValue2 data:(NSString *)stringData;
-(void)acceptRequestrequestUrl: (NSString *)url requestType: (NSString *)requestType value1: (NSString *)setValue1 header1: (NSString *)headerValue1 value2: (NSString *)setValue2 header2: (NSString *)headerValue2 value3:(NSString*)setValue3 header3:(NSString*)headerValue3 data:(NSString *)stringData;
@end
