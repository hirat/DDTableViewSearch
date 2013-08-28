//
//  IMFriend.h
//  IMDemo
//
//  Created by Hirat on 13-8-26.
//  Copyright (c) 2013年 Hirat. All rights reserved.
//  Email：hirats@gmail.com

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class IMMessage;

@interface IMFriend : NSManagedObject

@property (nonatomic, retain) NSNumber * friend_id;
@property (nonatomic, retain) NSString * friend_name;
@property (nonatomic, retain) NSSet *messages;
@end

@interface IMFriend (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(IMMessage *)value;
- (void)removeMessagesObject:(IMMessage *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

@end
