//
//  IMFriend+Helper.m
//  IMDemo
//
//  Created by Hirat on 13-8-26.
//  Copyright (c) 2013年 Hirat. All rights reserved.
//  Email：hirats@gmail.com

#import "IMFriend+Helper.h"

@implementation IMFriend (Helper)

+ (void)initTestData
{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
       
        for (int i = 1; i < 20; i ++)
        {
            NSNumber* friend_id = [NSNumber numberWithInt:i];
            IMFriend* friend = [IMFriend findFirstWithPredicate:[NSPredicate predicateWithFormat:@"friend_id = %@", friend_id] inContext:localContext];
            if (!friend)
            {
                friend = [IMFriend createInContext:localContext];
                friend.friend_id = friend_id;
            }
            
            friend.friend_name = [NSString stringWithFormat:@"客户%d", i];
        }
        
    } completion:^(BOOL success, NSError *error) {
        
        MYLog(@"IMFriend 测试数据已经生成！");
        
        [IMMessage initTestData];
        
    }];
}

@end
