//
//  ComposrViewController.h
//  twitter
//
//  Created by alexamorales on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "APIManager.h"
#import "tweet.h"
#import "TimelineViewController.h"


NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@end

@interface ComposrViewController : UIViewController
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
//@protocol ComposrViewControllerDelegate;

- (void)didTweet:(Tweet *)tweet;
@end

NS_ASSUME_NONNULL_END
