//
//  TweetCell.m
//  twitter
//
//  Created by alexamorales on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)refreshViews {

    // TO-DO
    _retweetCountLabel.text = [NSString stringWithFormat:@"%d",_tweet.retweetCount];
}

@end
