//
//  AMSAuthenticationViewController.m
//
//  Created by Steve Moser on 1/6/14.
//

#import "AMSAuthenticationViewController.h"

#import <GigyaSDK/Gigya.h>

@interface AMSAuthenticationViewController () <UITextFieldDelegate>



@end

@implementation AMSAuthenticationViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Social Login
- (void)activateFacebook
{
    [Gigya loginToProvider:@"facebook"
                parameters:nil
         completionHandler:^(GSUser *user, NSError *error) {
             if (error != nil) {
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)  message:error.localizedDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
                 [alert show];
             }
             else {
                 
             }
         }];
}

- (void)activateGooglePlus
{
    [Gigya loginToProvider:@"googleplus"
                parameters:nil
         completionHandler:^(GSUser *user, NSError *error) {
             if (error != nil) {
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error",nil) message:error.localizedDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil];
                 [alert show];             }
             else {
                 
             }
         }];
}

@end
