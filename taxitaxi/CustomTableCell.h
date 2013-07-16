//
//  CustomTableCell.h
//  taxitaxi
//
//  Created by aldiar on 22.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *adress;
@property (nonatomic, weak) IBOutlet UILabel *orderDetails;
@property (nonatomic, weak) IBOutlet UILabel *orderCostAndDistance;
@property (nonatomic, weak) IBOutlet UILabel *orderStreet;
@property (nonatomic, weak) IBOutlet UILabel *orderRating;

@end
