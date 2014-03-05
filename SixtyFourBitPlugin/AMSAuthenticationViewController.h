//
//  AMSAuthenticationViewController.h
//
//  Created by Steve Moser on 1/6/14.
//

#import <UIKit/UIKit.h>

#define AMSGSAccountPendingRegisration 206001

@interface AMSAuthenticationViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableViewCell *googlePlusTableViewCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *facebookTableViewCell;

- (void)activateFacebook;
- (void)activateGooglePlus;

@end
