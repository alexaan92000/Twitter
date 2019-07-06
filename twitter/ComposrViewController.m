//
//  ComposrViewController.m
//  twitter
//
//  Created by alexamorales on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposrViewController.h"
#import "AppDelegate.h"
#import "APIManager.h"
#import "tweet.h"
#import "TimelineViewController.h"

@interface ComposrViewController ()

@end

@implementation ComposrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dismissViewControllerAnimated:true completion:nil];
    // Do any additional setup after loading the view.
}


//-(IBAction)postTweet:(UIBarButtonItem *)sender){
//    [[[APIManager shared]postStatusWithText:self.tweetTextView.text completion:^( *, NSError *error){
//        if(error){
//        }
//            else{
//                [self.delegate didTweet: tweet];
//                [self dismissViewControllerAnimated:YES completion:nil];
//        }
//    }];
// }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
     

@end
 
