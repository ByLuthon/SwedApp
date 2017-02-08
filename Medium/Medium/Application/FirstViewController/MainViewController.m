//
//  MainViewController.m
//  Medium
//
//  Created by macmini on 02/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = TRUE;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)twitter:(id)sender
{
    CreateAccountViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateAccountViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

- (IBAction)facebook:(id)sender
{
    /*
    CustomTabbarViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomTabbarViewController"];
    [self.navigationController pushViewController:move animated:YES];
*/
    CreateAccountViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateAccountViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

- (IBAction)google:(id)sender
{
    CreateAccountViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateAccountViewController"];
    [self.navigationController pushViewController:move animated:YES];
}

- (IBAction)signinWithEmail:(id)sender
{
    IntroViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"IntroViewController"];
    [self presentViewController:move animated:YES completion:nil];
}
@end
