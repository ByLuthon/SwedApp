//
//  ViewProfileViewController.h
//  Medium
//
//  Created by macmini on 07/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface ViewProfileViewController : UIViewController <UIScrollViewDelegate>
{
    int selectedTab;

    __weak IBOutlet UIScrollView *scrl;
    __weak IBOutlet UIScrollView *sub_Scrl;
    IBOutlet UIView *subview;
    
    IBOutlet UITableView *tbl_profile;
    IBOutlet UITableView *tbl_Recommends;
    IBOutlet UITableView *tbl_Responces;
    
    __weak IBOutlet UIView *view_Segment;
    __weak IBOutlet UIButton *btn_profile;
    __weak IBOutlet UIButton *btn_Recommeds;
    __weak IBOutlet UIButton *btn_responces;
    
}
- (IBAction)Back:(id)sender;
- (IBAction)SegmentTapped:(id)sender;
- (IBAction)Edit:(id)sender;
- (IBAction)share:(id)sender;

@end
