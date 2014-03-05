//
//  SEMViewController.m
//  SixtyFourBitPlugin
//
//  Created by Steve Moser on 3/5/14.
//  Copyright (c) 2014 Steve Moser. All rights reserved.
//

#import "SEMViewController.h"

#import <GigyaSDK/Gigya.h>


@interface SEMViewController () <GSPluginViewDelegate>

@property (weak, nonatomic) IBOutlet GSPluginView *gigyaRatingView;


@end

@implementation SEMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.gigyaRatingView setDelegate:self];
    NSDictionary *params = @{
                             @"categoryID": @"Activation Reviews",
                             @"streamID": @"",
                             @"containerID": @"ratingDiv",
                             @"cid":@"",
                             @"enabledShareProviders": @"facebook,google"
                             };
    
    [self.gigyaRatingView loadPlugin:@"comments.commentsUI" parameters:params];
}

- (void)pluginView:(GSPluginView *)pluginView didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:error.localizedDescription  message:error.localizedRecoverySuggestion delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
