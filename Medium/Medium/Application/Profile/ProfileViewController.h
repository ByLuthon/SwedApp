//
//  ProfileViewController.h
//  Medium
//
//  Created by macmini on 06/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface ProfileViewController : UIViewController 
{
    NSMutableArray *arrSection1;
    NSMutableArray *arrSection2;
    
    __weak IBOutlet UITableView *tbl;
    IBOutlet UIView *subview_profile;
}
- (IBAction)viewProfile:(id)sender;
@end
