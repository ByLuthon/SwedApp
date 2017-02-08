//
//  StatsViewController.h
//  Medium
//
//  Created by macmini on 08/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface StatsViewController : UIViewController
{
    int selectedTab;

    
    __weak IBOutlet UIScrollView *mainscrl;
    __weak IBOutlet UIScrollView *scrl;
    IBOutlet UIView *subview;
    
    __weak IBOutlet UIView *subview_graph;
    __weak IBOutlet UIView *subview_Segment;
    __weak IBOutlet UIButton *btn_Stories;
    __weak IBOutlet UIButton *btn_Responces;
    IBOutlet UITableView *tbl_stories;
    IBOutlet UITableView *tbl_responces;
}
- (IBAction)Back:(id)sender;
- (IBAction)segmentTapped:(id)sender;

@end
