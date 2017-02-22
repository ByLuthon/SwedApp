//
//  TableViewCell.h
//  Medium
//
//  Created by macmini on 22/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UIButton *btn_click1;
@property (weak, nonatomic) IBOutlet UIButton *btn_click2;
- (IBAction)follow:(id)sender;

@end
