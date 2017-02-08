//
//  BookmarksViewController.h
//  Medium
//
//  Created by macmini on 06/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookmarksViewController : UIViewController
{
    
    __weak IBOutlet UIButton *btn_back;
}
@property (readwrite) BOOL isshowBack;
- (IBAction)Back:(id)sender;

@end
