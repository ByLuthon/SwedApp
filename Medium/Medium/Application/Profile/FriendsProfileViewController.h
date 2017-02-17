//
//  FriendsProfileViewController.h
//  Medium
//
//  Created by macmini on 17/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface FriendsProfileViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    
    IBOutlet UIView *subview_header;
    __weak IBOutlet UIView *view_navgation;
}


- (IBAction)Back:(id)sender;
- (IBAction)share:(id)sender;

- (IBAction)Following:(id)sender;
- (IBAction)Followers:(id)sender;
- (IBAction)tap:(id)sender;
- (IBAction)clickHere:(id)sender;

@end
