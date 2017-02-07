//
//  AddActivityViewController.h
//  Medium
//
//  Created by macmini on 06/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface AddActivityViewController : UIViewController
{
    
    __weak IBOutlet UITextView *txtview;
    __weak IBOutlet UIButton *btn_Drafts;
    __weak IBOutlet UIButton *btn_next;
}
- (IBAction)close:(id)sender;

@end
