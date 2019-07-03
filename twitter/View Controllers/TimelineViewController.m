//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "Tweet.h"
#import "TweetCell.h"



@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>
@end




@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [super viewDidLoad];
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *newTweets, NSError *error) {
        if (newTweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            self.tweets = [newTweets mutableCopy];
            
            for (Tweet *tweet in newTweets) {
                NSString *text = tweet.text;
            
                NSLog(@"%@", text);
            }
            
            [[self tableView] reloadData];
            
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
    
}

// numberOfRowsInSection

// cellForIndexPath

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    // initialize a blank TweetCell
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReusableTweetCell"];
    
    // populate that cell (set the labels' text and etc)
    Tweet *tweet = _tweets[indexPath.row];
    cell.tweet = tweet;
    [cell refreshViews];
    
    // return that cell
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_tweets == nil) {
        return 0;
    } else {
        return _tweets.count;
    }
}

@end
