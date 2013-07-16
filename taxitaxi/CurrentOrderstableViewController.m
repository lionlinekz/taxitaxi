//
//  CurrentOrderstableViewController.m
//  taxitaxi
//
//  Created by aldiar on 21.06.13.
//  Copyright (c) 2013 wakeup. All rights reserved.
//

#import "CurrentOrderstableViewController.h"

@interface CurrentOrderstableViewController ()

@end

@implementation CurrentOrderstableViewController

#define newReverseGeoCoding @"http://maps.googleapis.com/maps/api/geocode/json?latlng=%f,%f&sensor=true"
#define yandexApi @"http://geocode-maps.yandex.ru/1.x/?geocode=%f,%f&format=json"
@synthesize orderArray, currentAdressArray, destanationAdressArray, adresDictArray, ordersType;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSString *requestUrl;
    
    if([ordersType isEqualToString:@"MyOrder"]){
        requestUrl = @"http://www.taxitaxi.kz/dispatcher/index.php/api/getDriverOrders";
    }else if ([ordersType isEqualToString:@"CurrentOrder"]){
        requestUrl = @"http://www.taxitaxi.kz/dispatcher/index.php/api/getDriverCurrentOrder";
    }else if([ordersType isEqualToString:@"AwaitingOrder"]){
        requestUrl = @"http://www.taxitaxi.kz/dispatcher/index.php/api/getDriverAwaitingOrder";
    }
    
    RESTparser *restParser = [[RESTparser alloc] init];
    parser = [[SBJsonParser alloc]init];
    
    TaxiRiders *rider = [LoginViewController getRider];
    
    NSString *driverOrders = [restParser getRequest:requestUrl requestType:@"GET" value1:rider.car_number header1:@"X_USERNAME" value2:rider.x header2:@"X_PASSWORD" data:@""];
    
    NSDictionary *orders = [parser objectWithString:driverOrders];
    
    //testing dictionary
    
    orderArray = [self getTaxiRiderOrders:orders];
    
    adresDictArray = [[NSMutableArray alloc] init];
    
    NSURLResponse *urlResponse = nil;
    NSError *requestError;
    
    for(int i=0; i<[orderArray count]; i++){
        double desLat = [[[orderArray objectAtIndex:i] des_lat] doubleValue];
        double desLng = [[[orderArray objectAtIndex:i] des_lng] doubleValue];
        
        double orLat = [[[orderArray objectAtIndex:i] or_lat] doubleValue];
        double orLng = [[[orderArray objectAtIndex:i] or_lng] doubleValue];
        
        NSMutableURLRequest *mutable = [[NSMutableURLRequest alloc] init];
        
        NSString *urlString = [NSString stringWithFormat:yandexApi,desLng, desLat];
        
        [mutable setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString]]];
        
        NSData *response2 = [NSURLConnection sendSynchronousRequest:mutable returningResponse:&urlResponse error:&requestError];
        
        NSDictionary *testPlease = [NSJSONSerialization JSONObjectWithData:response2 options:0 error:nil];
        
        NSString *testString = [[NSString alloc] init];
        
        testString = testPlease[@"response"][@"GeoObjectCollection"][@"featureMember"][0][@"GeoObject"][@"metaDataProperty"][@"GeocoderMetaData"][@"AddressDetails"][@"Country"][@"AddressLine"];
        [adresDictArray addObject:testString];
        /////////////////////////////////////////
        
        
        NSMutableURLRequest *mutable1 = [[NSMutableURLRequest alloc] init];
        
        NSString *urlString1 = [NSString stringWithFormat:yandexApi,orLng, orLat];
        
        [mutable1 setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString1]]];
        
        NSData *response21 = [NSURLConnection sendSynchronousRequest:mutable1 returningResponse:&urlResponse error:&requestError];
        
        NSDictionary *testPlease1 = [NSJSONSerialization JSONObjectWithData:response21 options:0 error:nil];
        
        NSString *testString1 = [[NSString alloc] init];
        
        testString1 = testPlease1[@"response"][@"GeoObjectCollection"][@"featureMember"][0][@"GeoObject"][@"metaDataProperty"][@"GeocoderMetaData"][@"AddressDetails"][@"Country"][@"AddressLine"];
        ////////////////////////////////////////
        //NSString *where = [[NSString alloc] init];
        //where = [self convertLat:desLng longitude:desLat];
        
        //NSLog(@"%@", where);
        
        //NSString *from = [self convertLat:orLng longitude:orLat];
        
        TaxiOrders *order = [orderArray objectAtIndex:i];
        order.whereAdres = testString;
        order.fromAdres = testString1;
        [orderArray replaceObjectAtIndex:i withObject:order];
        
    }
    
    [super viewDidLoad];
}


-(NSString*)convertLat:(double)lat longitude:(double)lng{
    
    NSURLResponse *urlResponse = nil;
    NSError *requestError;
    
    NSMutableURLRequest *mutable = [[NSMutableURLRequest alloc] init];
    
    
    NSString *urlString = [NSString stringWithFormat:yandexApi,lng, lat];
    
    [mutable setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",urlString]]];

    NSData *response2 = [NSURLConnection sendSynchronousRequest:mutable returningResponse:&urlResponse error:&requestError];
    
    NSDictionary *testPlease = [NSJSONSerialization JSONObjectWithData:response2 options:0 error:nil];
    
    NSString *testString;// = [[NSString alloc] init];
    
    testString = [NSString stringWithFormat:@"%@",testPlease[@"response"][@"GeoObjectCollection"][@"featureMember"][0][@"GeoObject"][@"metaDataProperty"][@"GeocoderMetaData"][@"AddressDetails"][@"Country"][@"AddressLine"]];
    
    NSLog(@"%@", testString);
    
    return testString;
}

////

-(NSString *)getStringAdressLat:(double)lat andLng:(double)lng{
    
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    CLLocation *currentPoint = [[CLLocation alloc] initWithLatitude:lat longitude:lng];
    
    __block NSString *stringAdres;
    
    [geoCoder reverseGeocodeLocation: currentPoint completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         
         //Get address
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         
         //String to address
         //NSString *locatedaddress = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
         
         stringAdres = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
         
         //[destanationAdressArray addObject:locatedaddress];
     }];
    
    return stringAdres;
}


-(NSString *)getAddressFromLatLon:(double)pdblLatitude withLongitude:(double)pdblLongitude
{
    NSString *urlString = [NSString stringWithFormat:yandexApi,pdblLatitude, pdblLongitude];
    NSError* error;
    
    NSString *newStringTest = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:urlString] encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingKOI8_R) error:&error];
    
    //NSString *locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:&error];
    //locationString = [locationString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    //return [locationString substringFromIndex:6];
    return newStringTest;
}



-(NSMutableArray *)getTaxiRiderOrders:(NSDictionary*)dict{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    for(int i=0; i<[dict count]; i++){
        
        TaxiOrders *taxiorder = [[TaxiOrders alloc] initWithOrderId:[[dict valueForKey:@"id"] objectAtIndex:i] userId:[[dict valueForKey:@"uid"] objectAtIndex:i] driverId:[[dict valueForKey:@"did"] objectAtIndex:i] type:[[dict valueForKey:@"type"] objectAtIndex:i] notes:[[dict valueForKey:@"notes"] objectAtIndex:i] orLat:[[dict valueForKey:@"or_lat"] objectAtIndex:i] orLng:[[dict valueForKey:@"or_lng"] objectAtIndex:i] desLat:[[dict valueForKey:@"des_lat"] objectAtIndex:i] desLng:[[dict valueForKey:@"des_lng"] objectAtIndex:i] cost:[[dict valueForKey:@"cost"] objectAtIndex:i] rating:[[dict valueForKey:@"rating"] objectAtIndex:i] date:[[dict valueForKey:@"date"] objectAtIndex:i] time:[[dict valueForKey:@"time"] objectAtIndex:i] status:[[dict valueForKey:@"status"] objectAtIndex:i]];
        [array addObject:taxiorder];
    }
    return array;
}


////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [orderArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *customCellIdentifier = @"CustomTableCell";
    //vstavka customnoi cell iz niba
    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:customCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    
    cell.orderCostAndDistance.text = [[orderArray objectAtIndex:indexPath.row ]fromAdres];
    cell.orderRating.text = [[orderArray objectAtIndex:indexPath.row] rating];
    
    cell.orderDetails.text = [[orderArray objectAtIndex:indexPath.row ] date];
    cell.orderStreet.text = [[orderArray objectAtIndex:indexPath.row] time];
    
    cell.adress.text = [NSString stringWithFormat:@"%@",[[orderArray objectAtIndex:indexPath.row] whereAdres]];
    
    
    
    //NSString *mySuperTest = [adresDictArray objectAtIndex:indexPath.row];
    
    //NSLog(@"%@", mySuperTest);
    
    //cell.adress.text = mySuperTest;
    
    //double desLat = [[[orderArray objectAtIndex:indexPath.row] des_lat] doubleValue];
    //double desLng = [[[orderArray objectAtIndex:indexPath.row] des_lng] doubleValue];
    
    
    //NSString *jsonResponseGoogle = [self getAddressFromLatLon:desLat withLongitude:desLng];
    
    
    //NSDictionary *adresDict = [parser objectWithString:jsonResponseGoogle];
    //NSString *street = [[adresDict valueForKey:@"AddressLine"] objectAtIndex:indexPath.row];
    
    
    //NSLog(@"%@", adresDict);
    //NSString *adresString = [NSString stringWithFormat:@"%@", street];
    
    //cell.orderStreet.text = [destanationAdressArray objectAtIndex:indexPath.row];
    
    cell.contentView.backgroundColor = [UIColor darkGrayColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

/*-(void)viewWillAppear:(BOOL)animated{
    
    for(int i=0; i<[orderArray count]; i++){
        double desLat = [[[orderArray objectAtIndex:i] des_lat] doubleValue];
        double desLng = [[[orderArray objectAtIndex:i] des_lng] doubleValue];
        
        NSError *requestError;
        
        
        NSString *jsonResponseGoogle = [self getAddressFromLatLon:desLat withLongitude:desLng];
    
        SBJsonParser *jsonPraser = [[SBJsonParser alloc] init];
    }
}*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    
    if([ordersType isEqualToString:@"MyOrder"]){
        [self performSegueWithIdentifier:@"myOrders" sender:self];
    }else if ([ordersType isEqualToString:@"CurrentOrder"]){
        [self performSegueWithIdentifier:@"currentOrders" sender:self];
    }else if([ordersType isEqualToString:@"AwaitingOrder"]){
        [self performSegueWithIdentifier:@"awaitingOrders" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    OrderDetailsViewController *destViewController = segue.destinationViewController;
    
    TaxiOrders *currentOrder = [orderArray objectAtIndex:indexPath.row];
    
    destViewController.fromAdresString = [adresDictArray objectAtIndex:indexPath.row];
    destViewController.whereAdresString = [adresDictArray objectAtIndex:indexPath.row];
    destViewController.costString = [currentOrder cost];
    destViewController.orderID = [currentOrder orderID];
    
}

@end
