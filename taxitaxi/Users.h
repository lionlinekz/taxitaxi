//
//  Users.h
//  taxitaxi
//
//  Created by wakeup on 20.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Users : NSObject {
    NSString *phone;
    NSString *password;
    NSString *email;
    NSString *name;
    NSString *sname;
}

@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *sname;

-(id)initWithPhone:(NSString *)phone1 password:(NSString *)password1 email:(NSString *)email1 name:(NSString *)name1 sname:(NSString *)sname1;

@end
