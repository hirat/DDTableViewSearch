//
//  IMMessage+Helper.m
//  IMDemo
//
//  Created by Hirat on 13-8-26.
//  Copyright (c) 2013年 Hirat. All rights reserved.
//  Email：hirats@gmail.com

#import "IMMessage+Helper.h"

@implementation IMMessage (Helper)

+ (void)initTestData
{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {

        NSArray* allFriends = [IMFriend findAllSortedBy:@"friend_id" ascending:YES inContext:localContext];
        for (IMFriend* friend in allFriends)
        {
            for (int i = 0; i < 20; i++)
            {
                NSNumber* message_id = [NSNumber numberWithInt:[friend.friend_id intValue] * 1000 + i];
                IMMessage* message = [IMMessage findFirstWithPredicate:[NSPredicate predicateWithFormat:@"message_id = %@", message_id] inContext:localContext];
                if (!message)
                {
                    message = [IMMessage createInContext:localContext];
                    message.message_id = message_id;
                }
                message.created = [NSDate dateWithTimeIntervalSince1970: ([friend.friend_id intValue] * 30 + i)* 60 * 60 * 24];
                NSString* dateString = [NSDate stringFromDate:message.created withFormat:@"yyyy-MM-dd"];
                message.body = [NSString stringWithFormat:@"%@: %@", friend.friend_name, dateString];
                
                [friend addMessagesObject:message];
            }
        }
        
    } completion:^(BOOL success, NSError *error) {
        

        MYLog(@"IMMessage 测试数据已经生成！");
        
    }];
}

@end
