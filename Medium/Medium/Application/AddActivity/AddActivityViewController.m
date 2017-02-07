//
//  AddActivityViewController.m
//  Medium
//
//  Created by macmini on 06/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "AddActivityViewController.h"

@interface AddActivityViewController ()

@end

@implementation AddActivityViewController

- (void)viewDidLoad
{
    self.view.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [txtview becomeFirstResponder];
    
    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setInitParam
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
@end
