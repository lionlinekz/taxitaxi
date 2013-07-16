//
//  RESTparser.m
//  taxitaxi
//
//  Created by aldiar on 21.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "RESTparser.h"

@implementation RESTparser

@synthesize mutableRequest, request;

-(id)init{
    
    if (self = [super init]){
        
    	self.mutableRequest = [[NSMutableURLRequest alloc] init];
    }
    return self;
}

//general get request for all hyperlinks
-(NSString *)getRequest: (NSString *)url requestType: (NSString *)requestType value1: (NSString *)setValue1 header1: (NSString *)headerValue1 value2: (NSString *)setValue2 header2: (NSString *)headerValue2 data:(NSString *)stringData{

    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    [mutableRequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url]]];
    [mutableRequest setHTTPMethod:requestType];
    [mutableRequest setValue:setValue1 forHTTPHeaderField:headerValue1];
    [mutableRequest setValue:setValue2 forHTTPHeaderField:headerValue2];
    
        
    NSData *response1 = [NSURLConnection sendSynchronousRequest:mutableRequest returningResponse:&urlResponse error:&requestError];
        
    NSString *s = [[NSString alloc] initWithData:response1 encoding:NSUTF8StringEncoding];
    
    return s;
}

//post request
-(void)requestUrl: (NSString *)url requestType: (NSString *)requestType value1: (NSString *)setValue1 header1: (NSString *)headerValue1 value2: (NSString *)setValue2 header2: (NSString *)headerValue2 data:(NSString *)stringData{
    
    NSData *postData = [stringData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    [mutableRequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url]]];
    [mutableRequest setHTTPMethod:requestType];
    [mutableRequest setValue:setValue1 forHTTPHeaderField:headerValue1];
    [mutableRequest setValue:setValue2 forHTTPHeaderField:headerValue2];
    [mutableRequest setHTTPBody:postData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:mutableRequest delegate:self];
    
    [connection start];
    //[NSURLConnection sendSynchronousRequest:mutableRequest returningResponse:&urlResponse error:&requestError];
}
//post accept order request
-(void)acceptRequestrequestUrl: (NSString *)url requestType: (NSString *)requestType value1: (NSString *)setValue1 header1: (NSString *)headerValue1 value2: (NSString *)setValue2 header2: (NSString *)headerValue2 value3:(NSString*)setValue3 header3:(NSString*)headerValue3 data:(NSString *)stringData{
    
    NSData *postData = [stringData dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    [mutableRequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url]]];
    [mutableRequest setHTTPMethod:requestType];
    [mutableRequest setValue:setValue1 forHTTPHeaderField:headerValue1];
    [mutableRequest setValue:setValue2 forHTTPHeaderField:headerValue2];
    [mutableRequest setValue:setValue3 forHTTPHeaderField:headerValue3];
    [mutableRequest setHTTPBody:postData];
    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:mutableRequest delegate:self];
    
    [connection start];
    //[NSURLConnection sendSynchronousRequest:mutableRequest returningResponse:&urlResponse error:&requestError];
}


@end
