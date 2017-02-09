//
//  TrendingViewController.h
//  Medium
//
//  Created by macmini on 08/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "DTParallaxTableView.h"


@interface TrendingViewController : UIViewController 
{
    BOOL isshow;
    IBOutlet UIView *subview_header;
    __weak IBOutlet UILabel *lbl_navigationTitle;
}

- (IBAction)Back:(id)sender;

@property (weak, nonatomic) IBOutlet DTParallaxTableView *tbl;

@end
