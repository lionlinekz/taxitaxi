//
//  Users.m
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "Users.h"

@implementation Users

@synthesize name, sname, email, password, phone;

-(id)initWithPhone:(NSString *)phone1 password:(NSString *)password1 email:(NSString *)email1 name:(NSString *)name1 sname:(NSString *)sname1{
    
    self = [super init];
    if(self){
        phone = phone1;
        password = password1;
        email = email1;
        name = name1;//vhgh
        sname = sname1; //fer
    }
    return self;
}

@end
