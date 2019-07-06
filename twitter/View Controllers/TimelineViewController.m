//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "ComposrViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "Tweet.h"
#import "TweetCell.h"



@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDelegate>

@property(strong, nonatomic) NSArray *tweets;
@property(weak, nonatomic) IBOutlet UITableView *tableView;

@end




@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    // Initialize a UIRefreshControl


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
- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    
    // Create NSURL and NSURLRequest
    
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
// numberOfRowsInSection

// cellForIndexPath
}
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
    cell.name.text = tweet.user.name;
    cell.screen_name.text = tweet.user.screenName;
    cell.text.text=tweet.text;
    cell.created_at.text = tweet.createdAtString;
    cell.favorite_count.text=[NSString stringWithFormat: @"%i", tweet.favoriteCount];
    cell.retweet_count.text=[NSString stringWithFormat: @"%i", tweet.retweetCount];
//    cell.profile_image_url_https.text= profile_image_url_https

    
    // return that cell
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposrViewController *composrController = (ComposrViewController*)navigationController.topViewController;
    composrController.delegate = self;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (void)didTweet:(Tweet *)tweet {
    // do stuff :)
}

@end
