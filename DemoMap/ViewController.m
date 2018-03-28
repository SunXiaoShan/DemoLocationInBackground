//
//  ViewController.m
//  DemoMap
//
//  Created by Phineas.Huang on 26/03/2018.
//  Copyright © 2018 sunxiaoshan. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate, TDelegate> {
    CLLocationManager *myLocationManager;
    __weak IBOutlet UIScrollView *scrollerView;
    NSString *message;
    AppDelegate *appDelegate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.tDelegate = self;
    
    message = @"";
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"Core location get position success.");
    
    CLLocationCoordinate2D coordinate = [newLocation coordinate];
    double dblLatitude = coordinate.latitude;
    double dblLongitude = coordinate.longitude;
    
    message = [NSString stringWithFormat:@"%f %f\n%@", dblLatitude, dblLongitude, message];
    NSLog(@"ViewController: %f %f", dblLatitude, dblLongitude);
    dispatch_async(dispatch_get_main_queue(), ^{
        for(UIView *subview in [scrollerView subviews]) {
            [subview removeFromSuperview];
        }
    
        UILabel * label = [[UILabel alloc] init];
        [label setNumberOfLines:0];
        label.text=message;
        [label setFont:[UIFont fontWithName:@"Georgia" size:13.0]];
        CGSize labelsize=[label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(250, 1000.0) lineBreakMode:UILineBreakModeWordWrap];
        int y=0;
        label.frame=CGRectMake(38, y, 245, labelsize.height);
        [label setBackgroundColor:[UIColor clearColor]];
        scrollerView.showsVerticalScrollIndicator = NO;
        y+=scrollerView.frame.size.height;
        [scrollerView setContentSize:CGSizeMake(200,y+50)];
        [scrollerView addSubview:label];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
