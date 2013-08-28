//
//  IMMessage.h
//  IMDemo
//
//  Created by Hirat on 13-8-26.
//  Copyright (c) 2013年 Hirat. All rights reserved.
//  Email：hirats@gmail.com

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class IMFriend;

@interface IMMessage : NSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSNumber * message_id;
@property (nonatomic, retain) IMFriend *im_friend;

@end
