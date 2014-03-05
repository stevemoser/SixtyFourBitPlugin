//
//  SEMMainViewController.m
//  SixtyFourBitPlugin
//
//  Created by Steve Moser on 3/5/14.
//  Copyright (c) 2014 Steve Moser. All rights reserved.
//

#import "SEMMainViewController.h"

@interface SEMMainViewController ()

@end

@implementation SEMMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelToMain:(UIStoryboardSegue *)segue { }


@end
