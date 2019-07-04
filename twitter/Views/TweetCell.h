//
//  TweetCell.h
//  twitter
//
//  Created by alexamorales on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screen_name;
@property (weak, nonatomic) IBOutlet UILabel *created_at;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UILabel *favorite_count;
@property (weak, nonatomic) IBOutlet UIButton *favorited;
@property (weak, nonatomic) IBOutlet UILabel *retweet_count;
@property (weak, nonatomic) IBOutlet UIButton *retweeted;
@property (weak, nonatomic) IBOutlet UIImageView *profile_image_url_https;




@property (nonatomic, strong) Tweet *tweet;


- (void)refreshViews;


//nameLabel, screennameLabel,createdAtLabel, textLabel,retweetCountLabel, favoriteCountLabel, favoriteButton,retweetButton

@end

NS_ASSUME_NONNULL_END
