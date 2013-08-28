//
//  DDTableDetailViewController.m
//  DDTableViewSearch
//
//  Created by Hirat on 13-8-28.
//  Copyright (c) 2013年 Hirat. All rights reserved.
//  Email：hirats@gmail.com

#import "DDTableDetailViewController.h"

@interface DDTableDetailViewController ()

@end

@implementation DDTableDetailViewController

- (void)setFriend:(IMFriend *)friend
{
    _friend = friend;
    
    self.title = friend.friend_name;
    
    self.fetchedResultsController = [IMMessage fetchAllGroupedBy:nil withPredicate:[NSPredicate predicateWithFormat:@"im_friend = %@", friend] sortedBy:@"created" ascending:YES];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cell_id = @"DDTableDetailViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    IMMessage* message = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = message.body;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
