//
//  PublicationsViewController.h
//  Medium
//
//  Created by macmini on 03/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface PublicationsViewController : UIViewController
{
    NSMutableArray *arrList;
    __weak IBOutlet UITableView *tbl;
}
@property (strong, nonatomic) IBOutlet UIView *subview_header;
- (IBAction)Back:(id)sender;

@end
