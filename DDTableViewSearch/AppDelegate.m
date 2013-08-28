//
//  AppDelegate.m
//  DDTableViewSearch
//
//  Created by Hirat on 13-8-28.
//  Copyright (c) 2013年 Hirat. All rights reserved.
//  Email：hirats@gmail.com

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupAutoMigratingCoreDataStack];
    
    // Init test data
    [IMFriend initTestData];
    
    return YES;
}

@end
