//
//  HomeDetailsViewController.h
//  Medium
//
//  Created by macmini on 03/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface HomeDetailsViewController : UIViewController
{
    NSMutableArray *arrTags;

    __weak IBOutlet UIScrollView *scrl;
    IBOutlet UIView *view_Scrl;
    __weak IBOutlet UIView *view_tags;
}
- (IBAction)Back:(id)sender;

@end