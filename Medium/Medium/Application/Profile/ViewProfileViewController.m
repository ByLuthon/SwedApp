//
//  ViewProfileViewController.m
//  Medium
//
//  Created by macmini on 07/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "ViewProfileViewController.h"

@interface ViewProfileViewController ()

@end

@implementation ViewProfileViewController

- (void)viewDidLoad
{
    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setInitParam
{
    
    subview.frame = CGRectMake(0, 0, WIDTH, scrl.frame.size.height+155);
    
    [scrl addSubview:subview];
    scrl.contentSize = CGSizeMake(WIDTH , subview.frame.size.height);
    
    
    ///////////////////////
    tbl_profile.frame = CGRectMake(0, 0, WIDTH, sub_Scrl.frame.size.height);
    tbl_Recommends.frame = CGRectMake(WIDTH*1, 0, WIDTH, sub_Scrl.frame.size.height);
    tbl_Responces.frame = CGRectMake(WIDTH*2, 0, WIDTH, sub_Scrl.frame.size.height);
    
    [sub_Scrl addSubview:tbl_profile];
    [sub_Scrl addSubview:tbl_Recommends];
    [sub_Scrl addSubview:tbl_Responces];
    
    sub_Scrl.contentSize = CGSizeMake(WIDTH * 3 , 0);
    sub_Scrl.pagingEnabled = TRUE;
    
    CGPoint scrollPoint = CGPointMake(0, 0);
    [sub_Scrl setContentOffset:scrollPoint animated:YES];
    [sub_Scrl setDelegate:self];//Set delegate
    
    //Set Line Under Button
    [self setLineFrameUnderMenu:btn_profile];
    
    tbl_profile.scrollEnabled = FALSE;
    tbl_Recommends.scrollEnabled = FALSE;
    tbl_Responces.scrollEnabled = FALSE;

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UnderLine Button
-(void)resetButtontitleColor
{
    [btn_profile setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn_Recommeds setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn_responces setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}
-(void)setLineFrameUnderMenu:(UIButton *)btn
{
    [self resetButtontitleColor];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}
#pragma mark - ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"Y:%f",scrollView.contentOffset.y);
    
    if (scrollView == scrl)
    {
        if (scrollView.contentOffset.y > 154)
        {
            tbl_profile.scrollEnabled = TRUE;
            tbl_Recommends.scrollEnabled = TRUE;
            tbl_Responces.scrollEnabled = TRUE;
        }
        else
        {
            tbl_profile.scrollEnabled = FALSE;
            tbl_Recommends.scrollEnabled = FALSE;
            tbl_Responces.scrollEnabled = FALSE;
        }
    }
    if (scrollView == tbl_profile  || scrollView == tbl_Responces || scrollView == tbl_Recommends)
    {
        if (scrl.contentOffset.y > 154)
        {
            if (scrollView.contentOffset.y <= 0)
            {
                int temp = scrl.contentOffset.y + scrollView.contentOffset.y;
                scrl.contentOffset = CGPointMake(scrollView.contentOffset.x, temp);

                tbl_profile.scrollEnabled = FALSE;
                tbl_Recommends.scrollEnabled = FALSE;
                tbl_Responces.scrollEnabled = FALSE;
                
                scrl.scrollEnabled = TRUE;
            }
            else
            {
                tbl_profile.scrollEnabled = TRUE;
                tbl_Recommends.scrollEnabled = TRUE;
                tbl_Responces.scrollEnabled = TRUE;
            }
        }
        else
        {
            tbl_profile.scrollEnabled = FALSE;
            tbl_Recommends.scrollEnabled = FALSE;
            tbl_Responces.scrollEnabled = FALSE;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrllView
{
    if (scrllView == sub_Scrl)
    {
        CGFloat pageWidth = scrllView.frame.size.width;
        int page = floor((scrllView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        
        CGPoint scrollPoint;
        
        
        [self resetButtontitleColor];
        UIButton *btn;
        
        
        if (page == 0)
        {
            btn = btn_profile;
            [btn_profile setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            scrollPoint = CGPointMake(0, 0);
            [sub_Scrl setContentOffset:scrollPoint animated:YES];
        }
        else if (page == 1)
        {
            btn = btn_Recommeds;
            [btn_Recommeds setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            scrollPoint = CGPointMake(WIDTH*1, 0);
            [sub_Scrl setContentOffset:scrollPoint animated:YES];
        }
        else if (page == 2)
        {
            btn = btn_responces;
            [btn_responces setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            scrollPoint = CGPointMake(WIDTH*2, 0);
            [sub_Scrl setContentOffset:scrollPoint animated:YES];
        }
        
        
        [self switchingtheSegments:page+1];
    }
}

- (IBAction)SegmentTapped:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    int indx = 0;
    indx = (int)btn.tag;
    
    selectedTab = indx;
    switch (indx)
    {
        case 1:
            [self setLineFrameUnderMenu:btn_profile];
            break;
            
        case 2:
            [self setLineFrameUnderMenu:btn_Recommeds];
            break;
            
        case 3:
            [self setLineFrameUnderMenu:btn_responces];
            break;
            
            
        default:
            break;
    }
    
    [self switchingtheSegments:indx];
    
}

- (IBAction)Edit:(id)sender
{
    EditProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"EditProfileViewController"];
    [self presentViewController:move animated:YES completion:nil];
    //[self.navigationController pushViewController:move animated:YES];
}

- (IBAction)share:(id)sender
{
 }

- (IBAction)Following:(id)sender
{
    FollowingFollowersViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FollowingFollowersViewController"];
    move.isFollowing = TRUE;
    [self.navigationController pushViewController:move animated:YES];
}

- (IBAction)Followers:(id)sender
{
    FollowingFollowersViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FollowingFollowersViewController"];
    move.isFollowing = FALSE;
    [self.navigationController pushViewController:move animated:YES];
}


#pragma mark - switchSegments
-(void)switchSegments:(UIButton *)btn
{
    int indx = 0;
    indx = (int)btn.tag;
    [self switchingtheSegments:indx];
}
-(void)switchingtheSegments:(int)idx
{
    //LoadingMenu = idx;
    
    CGPoint scrollPoint;
    switch (idx)
    {
        case 1:
            scrollPoint = CGPointMake(0, 0);
            [sub_Scrl setContentOffset:scrollPoint animated:YES];
            break;
            
        case 2:
            scrollPoint = CGPointMake(WIDTH, 0);
            [sub_Scrl setContentOffset:scrollPoint animated:YES];
            break;
            
        case 3:
            scrollPoint = CGPointMake(WIDTH*2, 0);
            [sub_Scrl setContentOffset:scrollPoint animated:YES];
            break;
            
            
        default:
            break;
    }
}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == tbl_profile)
    {
        UIView *headerVw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)] ;
        //headerVw.backgroundColor=[UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];  // set color of header
        headerVw.backgroundColor = self.view.backgroundColor;
        
        UILabel *lblusername = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH, 30)];
        lblusername.textColor = [UIColor blackColor];
        lblusername.font = [UIFont boldSystemFontOfSize:14];
        lblusername.text = @"Recommended by Rlogical";
        [headerVw addSubview:lblusername];
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(WIDTH - 100, 10, 90, 30);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [button setTitle:@"See more" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button setOnTouchUpInside:^(id sender, UIEvent *event)
         {

         }];
        [headerVw addSubview:button];
        
        return headerVw;
    }
    else if (tableView == tbl_Recommends)
    {
        UIView *headerVw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)] ;
        //headerVw.backgroundColor=[UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];  // set color of header
        headerVw.backgroundColor = self.view.backgroundColor;
        
        UILabel *lblusername = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH, 30)];
        lblusername.textColor = [UIColor blackColor];
        lblusername.font = [UIFont boldSystemFontOfSize:14];
        lblusername.text = @"Recommended by Rlogical";
        [headerVw addSubview:lblusername];
        
        return headerVw;
    }
    else if (tableView == tbl_Responces)
    {
        UIView *headerVw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)] ;
        //headerVw.backgroundColor=[UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];  // set color of header
        headerVw.backgroundColor = self.view.backgroundColor;
        
        UILabel *lblusername = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH, 30)];
        lblusername.textColor = [UIColor blackColor];
        lblusername.font = [UIFont boldSystemFontOfSize:14];
        lblusername.text = @"Responces";
        [headerVw addSubview:lblusername];
        
        return headerVw;
    }
    else
    {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (tableView == tbl_profile)
    {
        return 70;
    }
    else if (tableView == tbl_Recommends)
    {
        return 509;
    }
    else if (tableView == tbl_Responces)
    {
        return 378;
    }
    else
    {
        return 0;
    }
}
/*
 -(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return 85;
 }
 */

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == tbl_profile)
    {
        return [self profileCell:tableView indexPath:indexPath Message:nil];
    }
    else if (tableView == tbl_Recommends)
    {
        return [self RecommendsCell:tableView indexPath:indexPath Message:nil];
    }
    else if (tableView == tbl_Responces)
    {
        return  [self ResponcesCell:tableView indexPath:indexPath Message:nil];
    }
    return nil;
}

-(Cell_profile *)profileCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_profile *cell = (Cell_profile *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_profile" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        {
            
        }
        
    }
    return cell;
}

-(Cell_Home *)RecommendsCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_Home *cell = (Cell_Home *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_Home" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            [cell.btn_like setOnTouchUpInside:^(id sender, UIEvent *event)
             {
                 if (cell.btn_like.selected == TRUE)
                 {
                     cell.btn_like.selected = FALSE;
                 }
                 else
                 {
                     cell.btn_like.selected = TRUE;
                 }
             }];
            
            
            [cell.btn_bookmarks setOnTouchUpInside:^(id sender, UIEvent *event)
             {
                 if (cell.btn_bookmarks.selected == TRUE)
                 {
                     cell.btn_bookmarks.selected = FALSE;
                 }
                 else
                 {
                     cell.btn_bookmarks.selected = TRUE;
                 }
             }];
            
            [cell.btn_img_profile setOnTouchUpInside:^(UIEvent *event, id sender)
             {
                 FriendsProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendsProfileViewController"];
                 [self.navigationController pushViewController:move animated:YES];
             }];

        }
        
    }
    return cell;
}

-(Cell_Responces *)ResponcesCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_Responces *cell = (Cell_Responces *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_Responces" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        {
            [cell.btn_like setOnTouchUpInside:^(id sender, UIEvent *event)
             {
                 if (cell.btn_like.selected == TRUE)
                 {
                     cell.btn_like.selected = FALSE;
                 }
                 else
                 {
                     cell.btn_like.selected = TRUE;
                 }
             }];
            
            
            [cell.btn_bookmarks setOnTouchUpInside:^(id sender, UIEvent *event)
             {
                 if (cell.btn_bookmarks.selected == TRUE)
                 {
                     cell.btn_bookmarks.selected = FALSE;
                 }
                 else
                 {
                     cell.btn_bookmarks.selected = TRUE;
                 }
             }];
            
            
            [cell.btn_user setOnTouchUpInside:^(id sender, UIEvent *event)
             {
                 FriendsProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendsProfileViewController"];
                 [self.navigationController pushViewController:move animated:YES];
             }];

        }
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}



@end
