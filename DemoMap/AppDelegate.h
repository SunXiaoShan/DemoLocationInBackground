//
//  AppDelegate.h
//  DemoMap
//
//  Created by Phineas.Huang on 26/03/2018.
//  Copyright © 2018 sunxiaoshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol TDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (weak, nonatomic) id<TDelegate> tDelegate;
@property (strong, nonatomic) UIWindow *window;


@end

