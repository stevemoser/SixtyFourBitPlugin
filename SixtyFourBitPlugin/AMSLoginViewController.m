//
//  AMSLoginViewController.m
//
//  Created by Steve Moser on 1/2/14.
//

#import "AMSLoginViewController.h"


//#import "AMSConstants.h"
#import "JVFloatLabeledTextField.h"

#import <GigyaSDK/Gigya.h>

@interface AMSLoginViewController () <GSSocializeDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *emailTextField;
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UITableViewCell *loginTableViewCell;




@end

@implementation AMSLoginViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [Gigya setSocializeDelegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)login
{
    NSDictionary* parameters = @{ @"loginID": self.emailTextField.text,
                                  @"password": self.passwordTextField.text};
    GSRequest *request = [GSRequest requestForMethod:@"accounts.login" parameters:parameters];
    [request sendWithResponseHandler:^(GSResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"error:%@",error.localizedDescription);
            if (response.errorCode == AMSGSAccountPendingRegisration) {
#warning Alert - Tell user them must finish registration

            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error",nil) message:error.localizedDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"OK",nil) otherButtonTitles:nil];
                [alert show];
            }
        }
        else {
            GSSession *session = [[GSSession alloc] initWithSessionToken:response[@"sessionInfo"][@"sessionToken"]
                                                                  secret:response[@"sessionInfo"][@"sessionSecret"]];
            [Gigya setSession:session]; //session delegate dismisses after setting
        }
    }];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tappedCell = [tableView cellForRowAtIndexPath:indexPath];
    if (tappedCell == self.loginTableViewCell) {
        [self login];
    } else if (tappedCell == self.googlePlusTableViewCell) {
        [super activateGooglePlus];
    } else if (tappedCell == self.facebookTableViewCell) {
        [self activateFacebook];
    }
}

#pragma mark - Text field view delegate



- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.returnKeyType == UIReturnKeyGo) {
        [self login];
    } else if (textField.returnKeyType == UIReturnKeyNext) {
        [self.passwordTextField becomeFirstResponder];
    }

    return YES;
}

#pragma mark - GSSessionDelegate methods
- (void)userInfoDidChange:(GSUser *)user
{
    if (self.isViewLoaded && self.view.window) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //ModalStartRegistration

    
}

- (IBAction)cancelToLogin:(UIStoryboardSegue *)segue {
    // reset UI elements etc here
}

#pragma mark - Deallocation
- (void)dealloc
{
    // When this ViewController is deallocated, we must set Gigya's sessionDelegate to nil. If we don't, next time the user logs in there will be an exception.
    [Gigya setSocializeDelegate:nil];
}

@end
